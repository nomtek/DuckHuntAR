//
//  SceneLoader.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

final class SceneLoader {
    
    private let scene: SCNScene
    
    init?(name: String) {
        guard let scene = SCNScene(named: name) else {
            return nil
        }
        self.scene = scene
    }
    
    func rootNode() -> SCNNode {
        return scene.rootNode
    }
    
    func firstNode() -> SCNNode? {
        return scene.rootNode.childNodes.first
    }
    
    func node(named name: String) -> SCNNode? {
        return scene.rootNode.childNodes.filter {
            return $0.name == name
        }.first
    }
}
