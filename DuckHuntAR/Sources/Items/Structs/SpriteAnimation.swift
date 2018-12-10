//
//  SpriteAnimation.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 26.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SpriteKit

struct SpriteAnimation {
    let frames: [SKTexture]
    let timePerFrame: TimeInterval
    
    init(frames: [SKTexture], timePerFrame: TimeInterval) {
        self.frames = frames
        self.timePerFrame = timePerFrame
    }
    
    init(names: [String], timePerFrame: TimeInterval) {
        frames = names.map { SKTexture(imageNamed: $0) }
        self.timePerFrame = timePerFrame
    }
}
