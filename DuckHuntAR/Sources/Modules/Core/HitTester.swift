//
//  HitTester.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 05.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import ARKit
import SceneKit

protocol HitTester {
    func hitTest(_ point: CGPoint, options: [SCNHitTestOption : Any]?) -> [SCNHitTestResult]
    func hitTest(_ point: CGPoint, types: ARHitTestResult.ResultType) -> [ARHitTestResult]
}

extension ARSCNView: HitTester { }
