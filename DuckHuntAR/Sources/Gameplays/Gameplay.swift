//
//  Gameplay.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import CoreGraphics
import Foundation

protocol Gameplay {
    func update(time: TimeInterval)
    func interact(at point: CGPoint, hitProvider: HitTester)
}
