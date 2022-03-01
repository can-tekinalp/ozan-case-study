//
//  BaseViewController.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var loadingIndicatorView = LoadingIndicatorView(frame: .zero)
    
    func showLoadingIndicator() {
        if loadingIndicatorView.superview == nil {
            view.addSubview(loadingIndicatorView)
            loadingIndicatorView.fillSuperView()
        }
        loadingIndicatorView.startAnimating()
    }
    
    func hideLoadingIndicator() {
        loadingIndicatorView.stopAnimating()
    }
}
