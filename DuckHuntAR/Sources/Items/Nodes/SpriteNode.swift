//
//  SpriteNode.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 26.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class SpriteNode: SCNNode {
    
    private let animationPlayer: SpriteAnimationScene
    
    init?(animation: SpriteAnimation) {
        guard let firstTexture = animation.frames.first else {
            return nil
        }
        let textureSize = firstTexture.size()
        animationPlayer = SpriteAnimationScene(size: textureSize)
        animationPlayer.play(animation: animation)
        
        super.init()
        
        let ratio = textureSize.width / textureSize.height
        let plane = SCNPlane(width: ratio * 1.0, height: 1.0)
        plane.firstMaterial?.diffuse.contents = animationPlayer
        plane.firstMaterial?.isDoubleSided = true
        
        geometry = plane
    }
    
    @available(*, unavailable, message: "Use init(coder:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func play(animation: SpriteAnimation) {
        animationPlayer.play(animation: animation)
    }
}
