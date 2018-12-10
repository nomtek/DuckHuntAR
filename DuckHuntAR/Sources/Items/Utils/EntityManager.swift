//
//  EntityManager.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit
import SceneKit

class EntityManager {
    
    private let nodeGraph: SCNNode
    private let componentSystems = [
        GKComponentSystem(componentClass: SpriteComponent.self),
        GKComponentSystem(componentClass: NodeAnimationComponent.self),
        GKComponentSystem(componentClass: AgentComponent.self),
        GKComponentSystem(componentClass: MoveAnimationsComponent.self),
        GKComponentSystem(componentClass: StateMachineComponent.self)
    ]
    private var toRemove = Set<GKEntity>()
    private var entities = Set<GKEntity>()
    
    init(nodeGraph: SCNNode) {
        self.nodeGraph = nodeGraph
    }
    
    func add(entity: GKEntity, to parentNode: SCNNode? = nil) {
        entities.insert(entity)
        
        let selectedParent = parentNode ?? nodeGraph
        if let spriteComponent = entity.component(ofType: SpriteComponent.self) {
            selectedParent.addChildNode(spriteComponent.node)
        }
        if let emptyNodeComponent = entity.component(ofType: EmptyNodeComponent.self) {
            selectedParent.addChildNode(emptyNodeComponent.node)
        }
        
        for system in componentSystems {
            system.addComponent(foundIn: entity)
        }
    }
    
    func remove(entity: GKEntity) {
        if let spriteComponent = entity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.removeFromParentNode()
        }
        if let emptyNodeComponent = entity.component(ofType: EmptyNodeComponent.self) {
            emptyNodeComponent.node.removeFromParentNode()
        }
        entities.remove(entity)
        toRemove.insert(entity)
    }
    
    func update(_ deltaTime: TimeInterval) {
        for system in componentSystems {
            system.update(deltaTime: deltaTime)
        }
        
        for entity in toRemove {
            for system in componentSystems {
                system.removeComponent(foundIn: entity)
            }
        }
        toRemove.removeAll()
    }
}
