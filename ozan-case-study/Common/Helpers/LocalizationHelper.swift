//
//  LocalizationHelper.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import Foundation

final class LocalizationHelper {
    
    static func localize(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
