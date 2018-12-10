//
//  MenuWireframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.06.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit
import UIKit

protocol MenuWireframe: class {
    func showHunt(at deltaY: Float)
}

class ProductionMenuWireframe: Wireframe, InstantiatingWireframe, MenuWireframe {
    
    func instantiate() -> ViewController {
        let view = MenuViewController.instantiateFromStoryboard()
        
        let presenter = MenuPresenter(input: view, wireframe: self)
        view.output = presenter
        
        return view
    }
    
    func showHunt(at deltaY: Float) {
        ProductionHuntWireframe(
            transitionController: transitionController
        ).show(floorFoothold: SCNVector3(0.0, -deltaY, 0.0))
    }
}
