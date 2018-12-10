//
//  NodeAnimationComponent.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 28.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit
import SceneKit

class NodeAnimationComponent: GKComponent {
    
    private(set) var isPlaying = false
    private(set) var didFinish = false
    private let sourceNode: SCNNode
    
    init(sourceNode: SCNNode) {
        self.sourceNode = sourceNode
        super.init()
    }
    
    @available(*, unavailable, message: "Use init(sourceNode:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func play(_ animation: NodeAnimation) {
        isPlaying = true
        sourceNode.runAction(animation.generateAction(),
                             completionHandler: { [weak self] in
            self?.isPlaying = false
            self?.didFinish = true
        })
    }
}
