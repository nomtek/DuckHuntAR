//
//  DuckFallAnimationProvider.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class DuckFallAnimationProvider: DuckSingleAnimationProvider {
    init(animations: DuckAnimations) {
        super.init(animation: animations.falling)
    }
    
    @available(*, unavailable, message: "Use init(animations:) instead")
    override init(animation: SpriteAnimation) {
        fatalError("Initializer not available")
    }
}
