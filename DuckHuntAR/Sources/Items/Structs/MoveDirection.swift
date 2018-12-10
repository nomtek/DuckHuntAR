//
//  MoveDirection.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import simd

enum MoveDirection {
    case up
    case upRight
    case right
    case bottomRight
    case bottom
    case bottomLeft
    case left
    case upLeft
    case nonDefined
    
    private static var errorMargin: Float { return 0.4 }
    
    init(vector: float2) {
        if vector.y > MoveDirection.errorMargin {
            if vector.x > MoveDirection.errorMargin {
                self = .upRight
            } else if vector.x < -MoveDirection.errorMargin {
                self = .upLeft
            } else {
                self = .up
            }
        } else if vector.y < -MoveDirection.errorMargin {
            if vector.x > MoveDirection.errorMargin {
                self = .bottomRight
            } else if vector.x < -MoveDirection.errorMargin {
                self = .bottomLeft
            } else {
                self = .bottom
            }
        } else {
            if vector.x > MoveDirection.errorMargin {
                self = .right
            } else if vector.x < -MoveDirection.errorMargin {
                self = .left
            } else {
                self = .nonDefined
            }
        }
    }
}
