//
//  AgentComponent.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 28.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit
import SceneKit

class AgentComponent: GKAgent2D, GKAgentDelegate {
    
    var isAvailable = true
    
    override init() {
        super.init()
        delegate = self
        
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        position = float2(sprite.node.position.x, sprite.node.position.y)
    }
    
    @available(*, unavailable, message: "Use init(avoid:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: GKAgentDelegate
    func agentWillUpdate(_ agent: GKAgent) {
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        position = float2(sprite.node.position.x, sprite.node.position.y)
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        sprite.node.position = SCNVector3Make(position.x,
                                              position.y,
                                              sprite.node.position.z)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        guard isAvailable else { return }
        super.update(deltaTime: seconds)
    }
}

extension Entity {
    func agentComponent() -> AgentComponent? {
        return component(ofType: AgentComponent.self)
    }
}
