//
//  BlueDuckAnimations.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 26.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import Foundation

class BlueDuckAnimations: DuckAnimations {
    let flyUp: SpriteAnimation
    let flyUpRight: SpriteAnimation
    let flyRight: SpriteAnimation
    let hit: SpriteAnimation
    let falling: SpriteAnimation
    
    init() {
        flyUp = SpriteAnimation(
            names: [
                "hunt.scnassets/blue_duck/blue_duck_fly_up_0.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_up_1.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_up_2.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_up_1.png"
            ],
            timePerFrame: 0.08)
        
        flyUpRight = SpriteAnimation(
            names: [
                "hunt.scnassets/blue_duck/blue_duck_fly_up_right_0.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_up_right_1.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_up_right_2.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_up_right_1.png"
            ],
            timePerFrame: 0.08)
        
        flyRight = SpriteAnimation(
            names: [
                "hunt.scnassets/blue_duck/blue_duck_fly_right_0.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_right_1.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_right_2.png",
                "hunt.scnassets/blue_duck/blue_duck_fly_right_1.png"
            ],
            timePerFrame: 0.08)
        
        hit = SpriteAnimation(
            names: [
                "hunt.scnassets/blue_duck/blue_duck_hit.png"
            ],
            timePerFrame: 1.0)
        
        falling = SpriteAnimation(
            names: [
                "hunt.scnassets/blue_duck/blue_duck_falling.png"
            ],
            timePerFrame: 1.0)
    }
}
