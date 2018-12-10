//
//  RandomMovementBehaviour.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class RandomMovementBahaviour: GKBehavior {
    init(avoid obstacles: [GKObstacle]) {
        super.init()
        setWeight(60.0, for: GKGoal(toWander: 25))
        setWeight(60.0, for: GKGoal(toAvoid: obstacles, maxPredictionTime: 1))
    }
}

