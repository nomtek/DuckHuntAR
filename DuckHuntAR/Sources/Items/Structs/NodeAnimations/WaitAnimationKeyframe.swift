//
//  WaitAnimationKeyframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

struct WaitAnimationKeyframe: NodeAnimationKeyframe {
    private let position: SCNVector3
    private let duration: TimeInterval
    
    init(position: SCNVector3, duration: TimeInterval) {
        self.position = position
        self.duration = duration
    }
    
    func generateAction() -> SCNAction {
        let positionAction = SCNAction.run { node in
            node.position = self.position
        }
        let waitAction = SCNAction.wait(duration: duration)
        return SCNAction.sequence([positionAction, waitAction])
    }
}

extension NodeAnimationKeyframeFactory {
    func wait(at position: SCNVector3, for duration: TimeInterval) -> WaitAnimationKeyframe {
        return WaitAnimationKeyframe(position: position, duration: duration)
    }
}
