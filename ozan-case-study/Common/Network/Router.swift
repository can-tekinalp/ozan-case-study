//
//  Router.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import Alamofire

protocol Router {
    var urlString: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }
    func buildRequest(parameters: [String: Any]) -> URLRequest?
}

extension Router {
    
    func buildRequest(parameters: [String: Any]) -> URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.name) }
        return try? encoding.encode(urlRequest, with: parameters)
    }
}
