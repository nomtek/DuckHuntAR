//
//  Hunt2DSubScene.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 01.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit
import SceneKit

struct Hunt2DSubScene {
    
    let obstacles: [GKObstacle]
    let duckSpawnPoint: KeyPoint
    let dogSpawnPoint: KeyPoint
    let bottomPoint: SCNVector3
    let rootNode: SCNNode
    
    init?(root: SCNNode) {
        if root.childNodes.isEmpty {
            return nil
        }
        
        guard let duckSpawnPoint = root.keyPoint(named: "duck_spawn_point"),
            let dogSpawnPoint = root.keyPoint(named: "dog_spawn_point") else {
            return nil
        }
        
        self.duckSpawnPoint = duckSpawnPoint
        self.dogSpawnPoint = dogSpawnPoint
        
        let flyArea = root.childNodes
            .filter { $0.name == "fly_area" }
        
        obstacles = flyArea.flatMap {
            GKPolygonObstacle.obstacles(from: $0)
        }
        bottomPoint = flyArea.compactMap {
            $0.bottomPoint()
        }.first ?? duckSpawnPoint.position
        
        rootNode = root
        
        let nodesToRemove = root.childNodes.filter {
            $0.categoryBitMask == NodeCategories.removedOnLoad.rawValue
        }
        for node in nodesToRemove {
            node.removeFromParentNode()
        }
    }
}

fileprivate extension GKPolygonObstacle {
    static func obstacles(from area: SCNNode) -> [GKPolygonObstacle] {
        let halfWidth = area.scale.x * 0.5
        let halfHeight = area.scale.y * 0.5
        return [
            GKPolygonObstacle.rectangle(middle: float2(area.position.x + halfWidth, area.position.y),
                                        width: 2.0,
                                        height: area.scale.y),
            
            GKPolygonObstacle.rectangle(middle: float2(area.position.x, area.position.y + halfHeight),
                                        width: area.scale.x,
                                        height: 2.0),
            
            GKPolygonObstacle.rectangle(middle: float2(area.position.x - halfWidth, area.position.y),
                                        width: 2.0,
                                        height: area.scale.y),
            
            GKPolygonObstacle.rectangle(middle: float2(area.position.x, area.position.y - halfHeight),
                                        width: area.scale.x,
                                        height: 2.0)
        ]
    }
    
    private static func rectangle(middle: float2, width: Float, height: Float) -> GKPolygonObstacle {
        let halfWidth = width * 0.5
        let halfHeight = height * 0.5
        
        let points = [
            float2(middle.x - halfWidth, middle.y + halfHeight),
            float2(middle.x + halfWidth, middle.y + halfHeight),
            float2(middle.x + halfWidth, middle.y - halfHeight),
            float2(middle.x - halfWidth, middle.y - halfHeight)
        ]
        return GKPolygonObstacle(points: points)
    }
}

fileprivate extension SCNNode {
    func keyPoint(named name: String) -> KeyPoint? {
        return childNodes
            .filter { $0.name == "dog_spawn_point" }
            .map { KeyPoint(position: $0.position, name: $0.name) }
            .first
    }
    
    func bottomPoint() -> SCNVector3 {
        return SCNVector3Make(position.x, position.y - scale.y * 0.5, position.z)
    }
}

