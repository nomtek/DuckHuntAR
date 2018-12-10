//
//  NodeAnimationKeyframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

protocol NodeAnimationKeyframe {    
    func generateAction() -> SCNAction
}
