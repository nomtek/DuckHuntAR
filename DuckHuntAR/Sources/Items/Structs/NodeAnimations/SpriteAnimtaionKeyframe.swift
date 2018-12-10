//
//  SpriteAnimtaionKeyframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

struct SpriteAnimtaionKeyframe: NodeAnimationKeyframe {
    private let child: NodeAnimationKeyframe
    private let spriteAnimation: SpriteAnimation
    
    init(spriteAnimation: SpriteAnimation, child: NodeAnimationKeyframe) {
        self.child = child
        self.spriteAnimation = spriteAnimation
    }
    
    func generateAction() -> SCNAction {
        let childAction = child.generateAction()
        
        let spriteAnimation = self.spriteAnimation
        let setAnimationAction = SCNAction.run { node in
            guard let spriteNode = node as? SpriteNode else {
                return
            }
            spriteNode.play(animation: spriteAnimation)
        }
        
        return SCNAction.sequence([
                setAnimationAction,
                childAction
            ])
    }
}

extension NodeAnimationKeyframeFactory {
    func play(animation: SpriteAnimation, child: NodeAnimationKeyframe) -> SpriteAnimtaionKeyframe {
        return SpriteAnimtaionKeyframe(spriteAnimation: animation, child: child)
    }
}
