//
//  TimeBasedGameplay.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 28.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import CoreGraphics
import Foundation

class TimeBasedGameplay: Gameplay {
    
    private var initialTime: TimeInterval?
    private var previousTime: TimeInterval = 0
    
    func update(time: TimeInterval) {
        
        // On first iteration just setup times
        if initialTime == nil {
            initialTime = time
            previousTime = time
            return
        }
        
        update(deltaTime: time - previousTime)
        
        previousTime = time
    }
    
    func update(deltaTime: TimeInterval) {
        // Override in child
    }
    
    func interact(at point: CGPoint, hitProvider: HitTester) {
        // Override in child
    }
}
