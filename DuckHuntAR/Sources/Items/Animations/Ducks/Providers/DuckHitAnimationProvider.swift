//
//  DuckHitAnimationProvider.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class DuckHitAnimationProvider: DuckSingleAnimationProvider {
    init(animations: DuckAnimations) {
        super.init(animation: animations.hit)
    }
    
    @available(*, unavailable, message: "Use init(animations:) instead")
    override init(animation: SpriteAnimation) {
        fatalError("Initializer not available")
    }
}
