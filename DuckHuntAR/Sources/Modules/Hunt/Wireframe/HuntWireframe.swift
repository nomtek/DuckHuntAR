//
//  HuntWireframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.06.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

protocol HuntWireframe {
    
}

class ProductionHuntWireframe: Wireframe {
    
    func show(floorFoothold: SCNVector3) {
        let view = HuntViewController.instantiateFromStoryboard()
        let scene = HuntScene(floorFoothold: floorFoothold)
        let entityManager = EntityManager(nodeGraph: scene.entitesContainer)
        let gameplay = HuntGameplay(entityManager: entityManager)
        
        view.gameplay = gameplay
        view.scene = scene
        gameplay.dogAnimation = DogEntryAnimation(points: scene.dogPoints)
        gameplay.subScenes = scene.gameplayElementsRoot.childNodes.compactMap {
            Hunt2DSubScene(root: $0)
        }
        
        transitionController.show(view, animated: true)
    }
}
