//
//  MoveAnimationsProvider.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

protocol MoveAnimationsProvider {
    func animation(for direction: MoveDirection) -> SpriteAnimation
    func rotation(for direction: MoveDirection) -> SCNVector4
}
