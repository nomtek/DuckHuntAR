//
//  HuntScene.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class HuntScene: Scene {
    
    private let worldNode: SCNNode
    private let dogPointsRootNode: SCNNode
    
    // MARK: Output
    var entitesContainer: SCNNode
    var dogPoints: [KeyPoint] {
        return dogPointsRootNode.childNodes.map {
            KeyPoint(position: $0.position, name: $0.name)
        }
    }
    let gameplayElementsRoot: SCNNode
    
    // MARK: Lifecycle
    init(floorFoothold: SCNVector3) {
        guard let loader = SceneLoader(name: "hunt.scnassets/scene.scn"),
            let world = loader.node(named: "world"),
            let dogPointsRoot = loader.node(named: "dog_points"),
            let gameplayRoot = loader.node(named: "gameplay") else {
            fatalError("Can't find graphics file")
        }
        
        entitesContainer = SCNNode()
        worldNode = world
        dogPointsRootNode = dogPointsRoot
        gameplayElementsRoot = gameplayRoot
        
        super.init()

        entitesContainer.addChildNode(worldNode)
        entitesContainer.addChildNode(gameplayElementsRoot)
        entitesContainer.rotation = SCNVector4Make(0.0, 1.0, 0.0, .pi)
        entitesContainer.position = SCNVector3Make(0.0, floorFoothold.y, 0.0)
        
        rootNode.addChildNode(entitesContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
