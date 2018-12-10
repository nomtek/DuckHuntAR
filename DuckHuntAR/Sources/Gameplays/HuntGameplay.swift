//
//  HuntGameplay.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class HuntGameplay: TimeBasedGameplay {
    
    // MARK: Dependencies
    var dogAnimation: DogEntryAnimation? {
        didSet {
            guard let dogAnimation = dogAnimation else {
                return
            }
            introEntity.play(dogAnimation.animation)
        }
    }
    var subScenes: [Hunt2DSubScene]? {
        didSet {
            selectedSubscene = subScenes?.first
        }
    }
    
    // MARK: Entities
    private let entityManager: EntityManager
    private let duckAnimations = DuckAnimationsFactory()
    private var selectedSubscene: Hunt2DSubScene?
    
    private let introEntity: SpectacleEntity
    private var globalSoundEntity: GlobalSoundEntity
    private var duckEntity: DuckEntity?
    
    private let dogLaughSound: SCNAudioSource
    private let dogHappySound: SCNAudioSource
    private let gunFireSound: SCNAudioSource
    
    init(entityManager: EntityManager) {
        self.entityManager = entityManager

        introEntity = SpectacleEntity(initial: DogSpriteAnimations.standing)
        entityManager.add(entity: introEntity)
        
        globalSoundEntity = GlobalSoundEntity()
        entityManager.add(entity: globalSoundEntity)
        
        guard let dogLaughSound = SCNAudioSource(fileNamed: "hunt.scnassets/sounds/dog_laugh.wav"),
            let dogHappySound = SCNAudioSource(fileNamed: "hunt.scnassets/sounds/dog_happy.wav"),
            let gunFireSound = SCNAudioSource(fileNamed: "hunt.scnassets/sounds/gun_fire.wav") else {
                fatalError("Can't load audio files.")
        }
        self.dogLaughSound = dogLaughSound
        self.dogHappySound = dogHappySound
        self.gunFireSound = gunFireSound
    }
    
    // MARK: Gameplay
    override func update(deltaTime: TimeInterval) {
        
        // Pass update to entities
        entityManager.update(deltaTime)
        
        // Wait for dog animation to finish
        if introEntity.didFinish == false {
            return
        }
        
        // Spawn duck if possible
        if duckEntity == nil, let subScene = selectedSubscene {
            let duckEntity = DuckEntity(spawnPosition: subScene.duckSpawnPoint.position,
                                        floorPosition: subScene.bottomPoint,
                                        avoid: subScene.obstacles,
                                        animations: duckAnimations.random())
            
            duckEntity.didFlyOut = { [weak self] in
                guard let `self` = self else { return }
                self.proceedToDog(animation: DogSpriteAnimations.laughing,
                                  at: subScene.dogSpawnPoint.position,
                                  playing: self.dogLaughSound)
            }
            duckEntity.didFall = { [weak self] in
                guard let `self` = self else { return }
                var position = subScene.dogSpawnPoint.position
                
                if let duckNode = duckEntity.spriteComponent()?.node {
                    position = SCNVector3Make(duckNode.position.x,
                                              subScene.dogSpawnPoint.position.y,
                                              duckNode.position.z)
                }
                
                self.proceedToDog(animation: DogSpriteAnimations.showingDuck,
                                  at: position,
                                  playing: self.dogHappySound)
            }
            
            entityManager.add(entity: duckEntity, to: subScene.rootNode)
            self.duckEntity = duckEntity
        }
    }
    
    override func interact(at point: CGPoint, hitProvider: HitTester) {
        if introEntity.didFinish == false {
            return
        }
        
        globalSoundEntity.play(audio: gunFireSound)
        let hits = hitProvider.hitTest(point, options: nil)
        for hit in hits {
            _ = duckEntity?.check(hit: hit)
        }
    }
    
    // MARK: Utils
    private func finishDuckHunt() {
        duckEntity = nil
        selectedSubscene = subScenes?.randomElement()
    }
    
    private func proceedToDog(animation: SpriteAnimation, at position: SCNVector3, playing sound: SCNAudioSource) {
        guard let subScene = selectedSubscene else { return }
        
        let entity = PoppingOutEntity(position: position,
                                      animation: animation,
                                      duration: 3.0,
                                      sound: sound)
        entityManager.add(entity: entity, to: subScene.rootNode)
        
        entity.completion = { [weak self] in
            self?.entityManager.remove(entity: entity)
            self?.finishDuckHunt()
        }
    }
}
