//
//  UIViewController+ShowAlert.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import UIKit

extension UIViewController {
    
    func showOkAlert(_ title: String, _ message: String) {
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showError(message: String) {
        showOkAlert("Error", message)
    }
}
