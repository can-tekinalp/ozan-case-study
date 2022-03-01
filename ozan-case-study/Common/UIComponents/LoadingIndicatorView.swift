//
//  LoadingIndicatorView.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import UIKit

class LoadingIndicatorView: UIView {
    
    private let loadingIndicatorView = UIActivityIndicatorView(style: .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(loadingIndicatorView)
        loadingIndicatorView.anchorCenterSuperview()
    }
    
    func startAnimating() {
        loadingIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        loadingIndicatorView.stopAnimating()
    }
}
