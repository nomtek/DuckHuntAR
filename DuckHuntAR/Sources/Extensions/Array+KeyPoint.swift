//
//  Array+KeyPoint.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

extension Array where Array.Element == KeyPoint {
    func position(named name: String) -> SCNVector3? {
        return filter { $0.name == name }.first?.position
    }
}
