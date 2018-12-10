//
//  DuckSingleAnimationProvider.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class DuckSingleAnimationProvider: MoveAnimationsProvider {
    
    private let animation: SpriteAnimation
    
    init(animation: SpriteAnimation) {
        self.animation = animation
    }
    
    func animation(for direction: MoveDirection) -> SpriteAnimation {
        return animation
    }
    
    func rotation(for direction: MoveDirection) -> SCNVector4 {
        return SCNVector4Make(0.0, 0.0, 0.0, 0.0)
    }
}
