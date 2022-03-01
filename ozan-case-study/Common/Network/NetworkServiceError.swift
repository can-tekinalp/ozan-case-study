//
//  NetworkServiceError.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import Foundation

enum NetworkServiceError: Error {
    case cancelled
    case unexpectedError
    case other(String)
    
    var message: String {
        switch self {
        case .cancelled:
            return makeLocalizationKey(with: "Cancelled")
        case .unexpectedError:
            return makeLocalizationKey(with: "UnexpectedError")
        case .other(let msg):
            return msg
        }
    }
    
    private func makeLocalizationKey(with key: String) -> String {
        return "NetworkServiceError.\(key)"
    }
}
