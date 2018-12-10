//
//  DuckDyingState.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class DuckDyingState: GKState {
    
    private weak var entity: Entity?
    private let duration: TimeInterval
    private let animations: DuckAnimations
    private var elapsedTime: TimeInterval = 0.0
    
    init(duration: TimeInterval, parent: Entity, animations: DuckAnimations) {
        entity = parent
        self.duration = duration
        self.animations = animations
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == DuckFallingState.self
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        guard let entity = entity else { return }
        
        entity.agentComponent()?.isAvailable = false
        entity.moveAnimationsComponent()?.animationsProvider = DuckHitAnimationProvider(animations: animations)
        entity.soundComponent()?.source = nil
        
        let audioSource = SCNAudioSource(fileNamed: "hunt.scnassets/sounds/duck_quack_mono.wav")
        entity.soundComponent()?.source = audioSource
        
        elapsedTime = 0.0
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    
        elapsedTime += seconds
        if elapsedTime > duration {
            entity?.stateMachineComponent()?.stateMachine.enter(DuckFallingState.self)
        }
    }
}
