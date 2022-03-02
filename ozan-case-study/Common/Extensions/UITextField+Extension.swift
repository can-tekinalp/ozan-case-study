//
//  UITextField+Extension.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import UIKit

extension UITextField {
    
    func addDoneButtonToKeyboard(title: String = "Tamam", target: Any? = nil, action: Selector? = nil) {
        let toolBar = UIToolbar()
        let spaceButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let doneButton = UIBarButtonItem(
            title: title, // TODO:
            style: .plain,
            target: target ?? self,
            action: action ?? #selector(resign)
        )
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.sizeToFit()
        inputAccessoryView = toolBar
    }
    
    @objc fileprivate func resign() {
        resignFirstResponder()
    }
}
