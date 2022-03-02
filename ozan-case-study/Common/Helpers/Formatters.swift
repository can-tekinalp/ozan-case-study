//
//  Formatters.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import Foundation

enum Formatters {
    
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
}
