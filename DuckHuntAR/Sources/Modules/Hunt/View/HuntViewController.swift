//
//  HuntViewController.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import ARKit
import SceneKit
import UIKit

class HuntViewController: ARViewController, ARSCNViewDelegate {

    // MARK: Module components
    var scene: SCNScene! {
        didSet { sceneView.scene = scene }
    }
    var gameplay: Gameplay?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        // Set touch
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        sceneView.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: Interactions:
    @objc private func viewTapped(sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: sceneView)
        gameplay?.interact(at: tapPoint, hitProvider: sceneView)
    }
    
    // MARK: - SCNSceneRendererDelegate
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        gameplay?.update(time: time)
    }

    // MARK: - ARSCNViewDelegate
    func session(_ session: ARSession, didFailWithError error: Error) { }
    func sessionWasInterrupted(_ session: ARSession) { }
    func sessionInterruptionEnded(_ session: ARSession) { }
}
