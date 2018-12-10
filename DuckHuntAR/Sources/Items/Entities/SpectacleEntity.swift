//
//  SpectacleEntity.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class SpectacleEntity: Entity {
    
    var isPlaying: Bool {
        return component(ofType: NodeAnimationComponent.self)?.isPlaying ?? false
    }
    var didFinish: Bool {
        return component(ofType: NodeAnimationComponent.self)?.didFinish ?? false
    }
    
    init(initial: SpriteAnimation) {
        super.init()
        
        let spriteComponent = SpriteComponent(animation: initial)
        spriteComponent.node.pivot = SCNMatrix4MakeTranslation(0.0, -0.5, 0.0)
        
        addComponent(spriteComponent)
        addComponent(NodeAnimationComponent(sourceNode: spriteComponent.node))
    }
    
    @available(*, unavailable, message: "Use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func play(_ animation: NodeAnimation) {
        component(ofType: NodeAnimationComponent.self)?.play(animation)
    }
}
