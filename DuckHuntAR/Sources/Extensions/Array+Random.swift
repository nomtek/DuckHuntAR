//
//  Array+Random.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 01.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import Foundation

extension Array {
    func randomElement() -> Element {
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
}
