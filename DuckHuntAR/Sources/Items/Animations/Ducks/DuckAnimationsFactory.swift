//
//  DuckAnimationsFactory.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import Foundation

class DuckAnimationsFactory {
    
    private let animations: [DuckAnimations] = [
        BlackDuckAnimations(),
        BlueDuckAnimations(),
        RedDuckAnimations()
    ]
    
    func random() -> DuckAnimations {
        return animations.randomElement()
    }
}
