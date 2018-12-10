//
//  DuckFallingState.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class DuckFallingState: GKState {
    
    var didFallAction: DuckEntity.Action?
    
    private weak var entity: Entity?
    private let animations: DuckAnimations
    private let estimatedPosition: SCNVector3
    
    init(to estimatedPosition: SCNVector3, parent: Entity, animations: DuckAnimations) {
        entity = parent
        self.estimatedPosition = estimatedPosition
        self.animations = animations
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == DuckDisappearingState.self
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        guard let entity = entity else { return }
        
        entity.agentComponent()?.isAvailable = false
        entity.moveAnimationsComponent()?.animationsProvider = DuckFallAnimationProvider(animations: animations)
        
        let audioSource = SCNAudioSource(fileNamed: "hunt.scnassets/sounds/duck_falling_mono.wav")
        entity.soundComponent()?.source = audioSource
    }
    
    override func willExit(to nextState: GKState) {
        super.willExit(to: nextState)
        if nextState is DuckDisappearingState {
            didFallAction?()
        }
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else { return }
        
        let currentPosition = sprite.node.position
        sprite.node.position = SCNVector3Make(currentPosition.x,
                                              currentPosition.y - Float(seconds * 5.0),
                                              currentPosition.z)
        
        if sprite.node.position.y < estimatedPosition.y {
            entity?.stateMachineComponent()?.stateMachine.enter(DuckDisappearingState.self)
        }
    }
}
