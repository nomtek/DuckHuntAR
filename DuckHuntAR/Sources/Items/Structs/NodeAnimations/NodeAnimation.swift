//
//  NodeAnimation.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

struct NodeAnimation {
    let keyframes: [NodeAnimationKeyframe]
    
    init(keyframes: [NodeAnimationKeyframe]) {
        self.keyframes = keyframes
    }
    
    func generateAction() -> SCNAction {
        return SCNAction.sequence(keyframes.map { $0.generateAction() })
    }
}
