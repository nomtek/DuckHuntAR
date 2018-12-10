//
//  PoppingOutEntity.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 06.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class PoppingOutEntity: GKEntity {
    
    var completion: (() -> Void)?
    
    init(position: SCNVector3,
         animation: SpriteAnimation,
         duration: TimeInterval,
         sound: SCNAudioSource) {
        super.init()
        
        let spriteComponent = SpriteComponent(animation: animation)
        addComponent(spriteComponent)

        let showDuration = 0.3
        let action = SCNAction.sequence([
            SCNAction.playAudio(sound, waitForCompletion: false),
            SCNAction.move(by: SCNVector3Make(0.0, spriteComponent.node.scale.y, 0.0),
                           duration: showDuration),
            SCNAction.wait(duration: duration - showDuration * 2.0),
            SCNAction.move(by: SCNVector3Make(0.0, -spriteComponent.node.scale.y, 0.0),
                           duration: showDuration)
        ])
        
        spriteComponent.node.runAction(
            action,
            completionHandler: { [weak self] in
                self?.completion?()
            }
        )
        spriteComponent.node.position = position
    }
    
    @available(*, unavailable, message: "Use init(position:, avoid:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
