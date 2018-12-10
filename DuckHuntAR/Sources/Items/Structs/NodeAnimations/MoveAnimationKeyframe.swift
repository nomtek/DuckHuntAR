//
//  MoveAnimationKeyframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

struct MoveAnimationKeyframe: NodeAnimationKeyframe {
    private let position: SCNVector3
    private let duration: TimeInterval
    
    init(position: SCNVector3, duration: TimeInterval) {
        self.position = position
        self.duration = duration
    }
    
    func generateAction() -> SCNAction {
        return SCNAction.move(to: position, duration: duration)
    }
}

extension NodeAnimationKeyframeFactory {
    func move(to position: SCNVector3, thru duration: TimeInterval) -> MoveAnimationKeyframe {
        return MoveAnimationKeyframe(position: position, duration: duration)
    }
}
