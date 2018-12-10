//
//  GlobalSoundEntity.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 07.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit
import SceneKit

class GlobalSoundEntity: GKEntity {
        
    override init() {
        super.init()
        addComponent(EmptyNodeComponent())
    }
    
    @available(*, unavailable, message: "Use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func play(audio: SCNAudioSource) {
        guard let node = component(ofType: EmptyNodeComponent.self)?.node else {
            return
        }
        node.runAction(SCNAction.playAudio(audio, waitForCompletion: false))
    }
}
