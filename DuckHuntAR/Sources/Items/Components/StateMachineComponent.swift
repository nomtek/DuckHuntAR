//
//  StateMachineComponent.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 05.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class StateMachineComponent: GKComponent {
    
    let stateMachine: GKStateMachine
    
    init(stateMachine: GKStateMachine) {
        self.stateMachine = stateMachine
        super.init()
    }
    
    @available(*, unavailable, message: "Use init(stateMachine:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        stateMachine.update(deltaTime: seconds)
    }
}

extension Entity {
    func stateMachineComponent() -> StateMachineComponent? {
        return component(ofType: StateMachineComponent.self)
    }
}
