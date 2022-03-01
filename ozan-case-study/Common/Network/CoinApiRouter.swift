//
//  CoinApiRouter.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import Alamofire

enum CoinApiRouter: Router {
    
    case getCoinList
    
    var path: String {
        switch self {
        case .getCoinList:
            return "/coins"
        }
    }
    
    var urlString: String {
        return "\(CoinApiRouter.baseURLString)\(path)"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var headers: HTTPHeaders {
        return .default
    }
}

extension CoinApiRouter {
    
    private static let baseURLString: String = {
        switch currentEnvironment {
        case .stage: return ""
        case .prod: return "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy"
        }
    }()
}
