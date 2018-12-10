//
//  DuckFlyingState.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class DuckFlyingState: GKState {
    
    private weak var entity: Entity?
    private let duration: TimeInterval
    private let animations: DuckAnimations
    private let edges: [GKObstacle]
    private var elapsedTime: TimeInterval = 0.0
    
    init(duration: TimeInterval,
         avoid edges: [GKObstacle],
         parent: Entity,
         animations: DuckAnimations) {
        self.duration = duration
        self.animations = animations
        self.edges = edges
        entity = parent
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == DuckFlyingOutState.self
            || stateClass == DuckDyingState.self
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        guard let entity = entity else { return }
        
        entity.agentComponent()?.isAvailable = true
        entity.agentComponent()?.maxAcceleration = 10.0
        entity.agentComponent()?.maxSpeed = 20.0
        entity.agentComponent()?.behavior = RandomMovementBahaviour(avoid: edges)
        entity.moveAnimationsComponent()?.animationsProvider = DuckMoveAnimationsProvider(animations: animations)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        if (entity?.soundComponent()?.source == nil) {
            let audioSource = SCNAudioSource(fileNamed: "hunt.scnassets/sounds/duck_flying_quack_mono.wav")
            audioSource?.loops = true
            entity?.soundComponent()?.source = audioSource
        }
        
        elapsedTime += seconds
        if elapsedTime > duration {
            entity?.stateMachineComponent()?.stateMachine.enter(DuckFlyingOutState.self)
        }
    }
}
