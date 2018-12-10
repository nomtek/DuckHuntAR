//
//  MenuViewController.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 08.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import UIKit

class MenuViewController: ViewController, MenuViewInput, UITextFieldDelegate {
    
    @IBOutlet private weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var heightTextField: UITextField!
    @IBOutlet private weak var startButton: UIButton!
    
    var output: MenuViewOutput!
    
    // MARK: Lifecycle    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillAppear(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    // MARK: Actions
    @IBAction func startButtonTapped(_ sender: UIButton) {
        heightTextField.resignFirstResponder()
        output.proceed()
    }
    
    // MARK: UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        updateButtonAvailability()
        return true
    }
    
    // MARK: EntryViewInput
    var playerHeight: Float {
        get { return Float(heightTextField.text?.replacingOccurrences(of: ",", with: ".") ?? "") ?? 0.0 }
        set { heightTextField.text = String(playerHeight)  }
    }
    
    // MARK: Utils
    private func updateButtonAvailability() {
        startButton.isEnabled = playerHeight > 0.0
    }
    
    // MARK: Simple keyboard handling
    @objc private func keyboardWillAppear(notification: NSNotification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        scrollViewBottomConstraint.constant = keyboardRect.height
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
            self.scrollView.contentOffset = CGPoint(x: 0.0, y: keyboardRect.height)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
                return
        }
        scrollViewBottomConstraint.constant = 0.0
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
}
