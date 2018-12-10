//
//  TransitionController.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 20.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit
import UIKit

class TransitionController: UIViewController {
    
    private(set) var child: ViewController?
    private var blurView: UIVisualEffectView!
    
    override func loadView() {
        super.loadView()
        
        let blurEffect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blurView.frame = view.bounds
    }
    
    func show(_ viewController: ViewController, animated: Bool = true) {
        let previousChild = child
        child = viewController
        
        if let previousChild = previousChild, animated {
            smoothTransition(from: previousChild, to: viewController)
        } else {
            directTransition(from: previousChild, to: viewController)
        }
    }
    
    fileprivate func smoothTransition(from previous: ViewController, to current: ViewController) {
        previous.willMove(toParent: nil)
        
        previous.view.frame = view.bounds
        current.view.frame = view.bounds
        
        blur(withDuration: 1.0, completion: { [unowned self] in
            self.addChild(current)
            self.view.addSubview(current.view)

            current.didMove(toParent: self)
            previous.removeFromParent()

            self.unblur(withDuration: 3.0, completion: {
                previous.view.removeFromSuperview()
            })
        })
    }
    
    fileprivate func blur(withDuration duration: TimeInterval, completion: (() -> ())? = nil) {
        blurView.alpha = 0.0
        view.bringSubviewToFront(blurView)
        UIView.animate(withDuration: duration,
                       animations: { [unowned self] in
            self.blurView.alpha = 1.0
        }, completion: { _ in
            completion?()
        })
    }
    
    fileprivate func unblur(withDuration duration: TimeInterval, completion: (() -> ())? = nil) {
        view.bringSubviewToFront(blurView)
        UIView.animate(withDuration: duration,
                       animations: {
            self.blurView.alpha = 0.0
        }, completion: { _ in
            completion?()
        })
    }
    
    fileprivate func directTransition(from previous: ViewController?, to current: ViewController) {
        previous?.willMove(toParent: nil)
        addChild(current)
        
        previous?.view.removeFromSuperview()
        current.view.frame = view.bounds
        view.addSubview(current.view)
        
        previous?.removeFromParent()
        current.didMove(toParent: self)
    }
}
