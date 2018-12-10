//
//  SoundComponent.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 06.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class SoundComponent: GKComponent {
    
    var source: SCNAudioSource? {
        didSet {
            setAudio(source: source)
        }
    }
    
    init(source: SCNAudioSource? = nil) {
        self.source = source
        super.init()
        setAudio(source: source)
    }
    
    @available(*, unavailable, message: "Use init(source:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAudio(source: SCNAudioSource?) {
        guard let node = entity?.component(ofType: SpriteComponent.self)?.node else {
            return
        }
        if let source = source {
            source.volume = 1.0
            source.shouldStream = false
            source.isPositional = true
            source.load()
            node.addAudioPlayer(SCNAudioPlayer(source: source))
        } else {
            node.removeAllAudioPlayers()
        }
    }
}

extension Entity {
    func soundComponent() -> SoundComponent? {
        return component(ofType: SoundComponent.self)
    }
}
