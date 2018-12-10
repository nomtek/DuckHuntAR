//
//  AppDelegate.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let transitionController = TransitionController()
    let rootWireframe: InstantiatingWireframe
    
    override init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        rootWireframe = ProductionMenuWireframe(transitionController: transitionController)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.makeKeyAndVisible()
        window?.rootViewController = transitionController
        
        transitionController.show(rootWireframe.instantiate(), animated: false)
        
        return true
    }
}
