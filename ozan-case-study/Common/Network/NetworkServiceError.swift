//
//  NetworkServiceError.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

enum NetworkServiceError: Error {
    static let unexpectedErrorMessage = "An unexpected error occured."
    
    case canceled
    case other(String)
}
