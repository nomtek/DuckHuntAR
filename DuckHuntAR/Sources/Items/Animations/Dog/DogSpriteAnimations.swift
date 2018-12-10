//
//  DogSpriteAnimations.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 26.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SpriteKit

class DogSpriteAnimations {
    
    static let standing = SpriteAnimation(
        names: [ "hunt.scnassets/dog/dog_walking_1.png" ],
        timePerFrame: 1.0)
    
    static let walking = SpriteAnimation(
        names: [
            "hunt.scnassets/dog/dog_walking_0.png",
            "hunt.scnassets/dog/dog_walking_1.png",
            "hunt.scnassets/dog/dog_walking_2.png",
            "hunt.scnassets/dog/dog_walking_3.png",
            "hunt.scnassets/dog/dog_walking_4.png"
        ],
        timePerFrame: 0.2)
    
    static let hearing = SpriteAnimation(
        names: [ "hunt.scnassets/dog/dog_jumping_0.png" ],
        timePerFrame: 1.0)
    
    static let jumping = SpriteAnimation(
        names: [ "hunt.scnassets/dog/dog_jumping_1.png" ],
        timePerFrame: 1.0)
    
    static let falling = SpriteAnimation(
        names: [ "hunt.scnassets/dog/dog_jumping_2.png" ],
        timePerFrame: 1.0)
    
    static let laughing = SpriteAnimation(
        names: [
            "hunt.scnassets/dog/dog_laugh_0.png",
            "hunt.scnassets/dog/dog_laugh_1.png"
        ],
        timePerFrame: 0.2)
    
    static let showingDuck = SpriteAnimation(
        names: [
            "hunt.scnassets/dog/dog_one_duck.png"
        ],
        timePerFrame: 1.0)
}
