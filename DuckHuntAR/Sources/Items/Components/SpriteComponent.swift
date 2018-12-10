//
//  SpriteComponent.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit
import SceneKit

class SpriteComponent: GKComponent {
    
    let node: SpriteNode
    
    init(animation: SpriteAnimation) {
        node = SpriteNode(animation: animation)!
        super.init()
    }
    
    @available(*, unavailable, message: "Use init(animation:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
}

extension Entity {
    func spriteComponent() -> SpriteComponent? {
        return component(ofType: SpriteComponent.self)
    }
}
