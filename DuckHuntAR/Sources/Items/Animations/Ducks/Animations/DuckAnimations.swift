//
//  DuckAnimations.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 26.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SpriteKit

protocol DuckAnimations {
    var flyUp: SpriteAnimation { get }
    var flyUpRight: SpriteAnimation { get }
    var flyRight: SpriteAnimation { get }
    var hit: SpriteAnimation { get }
    var falling: SpriteAnimation { get }
}
