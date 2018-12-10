//
//  SKAction+Animation.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 26.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SpriteKit

extension SKAction {
    class func animate(with animation: SpriteAnimation) -> SKAction {
        return animate(with: animation.frames,
                       timePerFrame: animation.timePerFrame)
    }
}
