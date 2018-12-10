//
//  MoveAnimationsComponent.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit
import SKLinearAlgebra

class MoveAnimationsComponent: GKComponent {
    
    var animationsProvider: MoveAnimationsProvider?
    private var previousPosition = SCNVector3Make(0, 0, 0)
    private var prevoiusDirection = MoveDirection.nonDefined
    
    init(animationsProvider: MoveAnimationsProvider? = nil) {
        self.animationsProvider = animationsProvider
        super.init()
    }
    
    @available(*, unavailable, message: "Use init(animationsProvider:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        
        let position = spriteComponent.node.position
        let positionChange = position - previousPosition
        previousPosition = position
        
        guard magnitude(positionChange) > 0 else {
            adjustAnimation(for: .nonDefined)
            return
        }
        
        let movement = normalize(positionChange)
        adjustAnimation(for: MoveDirection(vector: float2(x: movement.x, y: movement.y)))
    }
    
    private func adjustAnimation(for direction: MoveDirection) {
        guard direction != prevoiusDirection else {
            return
        }
        
        guard let spriteComponent = entity?.component(ofType: SpriteComponent.self),
            let animationsProvider = animationsProvider else {
                return
        }
        
        spriteComponent.node.play(animation: animationsProvider.animation(for: direction))
        spriteComponent.node.rotation = animationsProvider.rotation(for: direction)
        prevoiusDirection = direction
    }
}

extension Entity {
    func moveAnimationsComponent() -> MoveAnimationsComponent? {
        return component(ofType: MoveAnimationsComponent.self)
    }
}
