//
//  FadeInKeyframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

struct FadeInKeyframe: NodeAnimationKeyframe {
    private let child: NodeAnimationKeyframe
    private let duration: TimeInterval
    
    init(duration: TimeInterval, child: NodeAnimationKeyframe) {
        self.child = child
        self.duration = duration
    }
    
    func generateAction() -> SCNAction {
        let decoratedAction = child.generateAction()
        let fadeInAction = SCNAction.fadeIn(duration: duration)
        return SCNAction.group([decoratedAction, fadeInAction])
    }
}

extension NodeAnimationKeyframeFactory {
    func fadeIn(thru duration: TimeInterval, child: NodeAnimationKeyframe) -> FadeInKeyframe {
        return FadeInKeyframe(duration: duration, child: child)
    }
}
