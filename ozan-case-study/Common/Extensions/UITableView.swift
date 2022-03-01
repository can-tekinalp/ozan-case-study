//
//  UITableView.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import UIKit

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let label = UILabel(frame: .zero)
        label.text = message
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.sizeToFit()
        backgroundView = label
        separatorStyle = .none
        separatorInset = .zero
    }
    
    func restore() {
        backgroundView = nil
    }
}
