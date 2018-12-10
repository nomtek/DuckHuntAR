//
//  StoryboardInstantiable.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 15.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {
    static var typeSuffix: String { get }
}

extension StoryboardInstantiable {
    static func instantiateFromStoryboard(bundle: Bundle? = nil) -> Self {
        let identifier = String(describing: self).replacingOccurrences(of: typeSuffix, with: "")
        let storyboardName = identifier + "Storyboard"
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        
        _ = viewController.view
        guard let typedInstance = viewController as? Self else {
            fatalError("Wrong type of instantiated controller.")
        }
        return typedInstance
    }
}
