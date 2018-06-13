//
//  Extension.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 09/06/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            // Move the view up, so keyboard have space
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        // reset the view y origin if it has been moved
        if self.view.frame.origin.y < 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    // Dismissing the keyboard by tapping around
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UITableViewController {
    // Generic function to show error messages to user
    func genericAlert<T>(error: T) {
        let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}


extension UIAlertController {
    func presentInOwnWindow(animated: Bool, completion: (() -> Void)?) {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootVC.present(self, animated: animated, completion: completion)
    }
}







