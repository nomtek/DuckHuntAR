//
//  Wireframe.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.06.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import Foundation

protocol InstantiatingWireframe {
    func instantiate() -> ViewController
}

class Wireframe {
    let transitionController: TransitionController
    
    init(transitionController: TransitionController) {
        self.transitionController = transitionController
    }
}
