//
//  Result+Extension.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

extension Result {
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }

    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    var failure: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}

extension Result where Failure == NetworkServiceError {
    
    func transformNetworkResult() -> Result<Success, String> {
        if let success = success {
            return .success(success)
        }
        
        return .failure(failure!.message)
    }
}
