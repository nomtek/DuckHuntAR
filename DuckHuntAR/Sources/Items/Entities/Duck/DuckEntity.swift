//
//  DuckEntity.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class DuckEntity: Entity {
    
    typealias Action = () -> Void
    var didFlyOut: Action? {
        didSet {
            let flyOutState = stateMachineComponent()?.stateMachine.state(forClass: DuckFlyingOutState.self)
            flyOutState?.didFlyOutAction = didFlyOut
        }
    }
    var didFall: Action? {
        didSet {
            let fallState = stateMachineComponent()?.stateMachine.state(forClass: DuckFallingState.self)
            fallState?.didFallAction = didFall
        }
    }
    
    private var stateMachine: GKStateMachine!
    
    init(spawnPosition: SCNVector3,
         floorPosition: SCNVector3,
         avoid edges: [GKObstacle] = [],
         animations: DuckAnimations = BlackDuckAnimations()) {
        
        super.init()
        
        let sprite = SpriteComponent(animation: animations.hit)
        sprite.node.position = spawnPosition
        
        stateMachine = GKStateMachine(states: [
            DuckFlyingState(duration: 15.0, avoid: edges, parent: self, animations: animations),
            DuckFlyingOutState(duration: 3.0, parent: self, animations: animations),
            DuckDyingState(duration: 2.0, parent: self, animations: animations),
            DuckFallingState(to: floorPosition, parent: self, animations: animations),
            DuckDisappearingState(duration: 0.5, parent: self)
        ])
        
        addComponent(sprite)
        addComponent(AgentComponent())
        addComponent(MoveAnimationsComponent())
        addComponent(SoundComponent())
        addComponent(StateMachineComponent(stateMachine: stateMachine))
        
        stateMachine.enter(DuckFlyingState.self)
    }
    
    @available(*, unavailable, message: "Use init(position:, avoid:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func check(hit: SCNHitTestResult) -> Bool {
        guard let sprite = component(ofType: SpriteComponent.self),
            sprite.node == hit.node else {
            return false
        }
        stateMachine.enter(DuckDyingState.self)
        return true
    }
}
