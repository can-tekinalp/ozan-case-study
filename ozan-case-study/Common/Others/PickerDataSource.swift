//
//  PickerDataSource.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import Foundation

protocol PickerDataSource {
    var titles: [String] { get }
    var numberOfRows: Int { get }
    func titleFor(row: Int) -> String?
}

extension PickerDataSource {
    var numberOfRows: Int {
        return titles.count
    }
    
    func titleFor(row: Int) -> String? {
        return titles[safe: row]
    }
}
