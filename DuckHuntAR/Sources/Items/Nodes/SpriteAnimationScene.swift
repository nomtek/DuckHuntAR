//
//  SpriteAnimationScene.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 26.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SpriteKit

class SpriteAnimationScene: SKScene {
    
    private var spriteNode: SKSpriteNode!
    
    override init() {
        super.init()
        commonInit()
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        commonInit()
    }

    @available(*, unavailable, message: "Use init(size:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = UIColor.clear
        
        spriteNode = SKSpriteNode()
        spriteNode.size = size
        spriteNode.position = CGPoint(x: size.width * 0.5,
                                      y: size.height * 0.5)
        spriteNode.zRotation = .pi
        addChild(spriteNode)
    }
    
    func play(animation: SpriteAnimation) {
        spriteNode.removeAllActions()
        
        let animationAction = SKAction.animate(with: animation)
        let loopAction = SKAction.repeatForever(animationAction)
        
        spriteNode.run(loopAction)
    }
}
