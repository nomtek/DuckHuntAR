//
//  ARViewController.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 05.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import ARKit
import SceneKit
import UIKit

class ARViewController: ViewController {
    
    // MARK: Properties
    private(set) var sceneView: ARSCNView!
    
    // MARK: Lifecycle
    override func loadView() {
        sceneView = ARSCNView()
        view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.showsStatistics = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
}
