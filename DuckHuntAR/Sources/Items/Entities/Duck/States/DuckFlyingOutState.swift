//
//  DuckFlyingOutState.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class DuckFlyingOutState: GKState {
    
    var didFlyOutAction: DuckEntity.Action?
    
    private weak var entity: Entity?
    private let duration: TimeInterval
    private let animations: DuckAnimations
    private var elapsedTime: TimeInterval = 0.0
    
    init(duration: TimeInterval, parent: Entity, animations: DuckAnimations) {
        self.duration = duration
        self.animations = animations
        entity = parent
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == DuckDisappearingState.self
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)        
        guard let entity = entity else { return }

        entity.agentComponent()?.isAvailable = false
        entity.moveAnimationsComponent()?.animationsProvider = DuckMoveAnimationsProvider(animations: animations)
    }
    
    override func willExit(to nextState: GKState) {
        super.willExit(to: nextState)
        if nextState is DuckDisappearingState {
            didFlyOutAction?()
        }
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        elapsedTime += seconds
        if elapsedTime > duration {
            entity?.stateMachineComponent()?.stateMachine.enter(DuckDisappearingState.self)
        }
        
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else { return }
        
        let currentPosition = sprite.node.position
        sprite.node.position = SCNVector3Make(currentPosition.x,
                                              currentPosition.y + Float(seconds * 3.5),
                                              currentPosition.z)
    }
}
