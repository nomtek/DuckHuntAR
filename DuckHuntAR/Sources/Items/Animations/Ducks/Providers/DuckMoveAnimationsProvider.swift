//
//  DuckMoveAnimationsProvider.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class DuckMoveAnimationsProvider: MoveAnimationsProvider {
    
    private let animations: DuckAnimations
    
    init(animations: DuckAnimations) {
        self.animations = animations
    }
    
    func animation(for direction: MoveDirection) -> SpriteAnimation {
        switch direction {
        case .up:
            return animations.flyUp
        case .upRight, .bottomRight, .bottom:
            return animations.flyUpRight
        case .left, .right:
            return animations.flyRight
        case .upLeft, .bottomLeft:
            return animations.flyUpRight
        case .nonDefined:
            return animations.flyUpRight
        }
    }
    
    func rotation(for direction: MoveDirection) -> SCNVector4 {
        switch direction {
        case .upRight, .right, .bottomRight:
            return SCNVector4Make(0.0, 1.0, 0.0, .pi)
        case .up, .bottom, .bottomLeft, .left, .upLeft, .nonDefined:
            return SCNVector4Make(0.0, 0.0, 0.0, 0.0)
        }
    }
}
