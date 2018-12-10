//
//  FadeOutKeyframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 28.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

struct FadeOutKeyframe: NodeAnimationKeyframe {
    private let child: NodeAnimationKeyframe
    private let duration: TimeInterval
    
    init(duration: TimeInterval, child: NodeAnimationKeyframe) {
        self.child = child
        self.duration = duration
    }
    
    func generateAction() -> SCNAction {
        let decoratedAction = child.generateAction()
        let fadeInAction = SCNAction.fadeOut(duration: duration)
        return SCNAction.group([decoratedAction, fadeInAction])
    }
}

extension NodeAnimationKeyframeFactory {
    func fadeOut(thru duration: TimeInterval, child: NodeAnimationKeyframe) -> FadeOutKeyframe {
        return FadeOutKeyframe(duration: duration, child: child)
    }
    
    func fadeOut(at position: SCNVector3, thru duration: TimeInterval) -> FadeOutKeyframe {
        return FadeOutKeyframe(duration: duration, child: wait(at: position, for: duration))
    }
}
