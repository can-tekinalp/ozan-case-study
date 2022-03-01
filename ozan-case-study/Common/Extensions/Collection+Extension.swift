//
//  Collection+Extension.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

extension Collection {

    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
