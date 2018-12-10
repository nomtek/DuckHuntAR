//
//  SoundKeyframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 06.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

struct SoundKeyframe: NodeAnimationKeyframe {
    private let child: NodeAnimationKeyframe
    private let path: String
    
    init(path: String, child: NodeAnimationKeyframe) {
        self.child = child
        self.path = path
    }
    
    func generateAction() -> SCNAction {
        let decoratedAction = child.generateAction()
        guard let source = SCNAudioSource(fileNamed: path) else {
            fatalError("Can't load audio file")
        }
        let soundAction = SCNAction.playAudio(source, waitForCompletion: false)
        return SCNAction.group([decoratedAction, soundAction])
    }
}

extension NodeAnimationKeyframeFactory {
    func playSound(path: String, child: NodeAnimationKeyframe) -> SoundKeyframe {
        return SoundKeyframe(path: path, child: child)
    }
}
