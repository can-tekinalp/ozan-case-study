//
//  NetworkService.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import Alamofire

class NetworkService {
    
    static let shared = NetworkService()
    private let session: URLSession
        
    init(session: URLSession = defaultSession()) {
        self.session = session
    }
    
    @discardableResult
    func request<T: Decodable>(decodable : T.Type, router: Router, parameters: [String: Any], dispatchOn: DispatchQueue = .main, handler: @escaping (Result<T, NetworkServiceError>) -> Void) -> DataRequest? {
        guard let request = router.buildRequest(parameters: parameters) else {
            handler(.failure(.unexpectedError))
            return nil
        }
    
        return AF.request(request).responseDecodable(of: T.self) { (dataResponse) in
            dispatchOn.async { [weak self] in
                self?.handleResponse(response: dataResponse, handler: handler)
            }
        }
    }
    
    private func handleResponse<T: Decodable>(response: DataResponse<T, AFError>, handler: @escaping (Result<T, NetworkServiceError>) -> Void) {
        switch response.result {
        case .success(let response):
            handler(.success(response))
        case .failure(let error):
            switch error {
            case .explicitlyCancelled:
                handler(.failure(.cancelled))
            default:
                handler(.failure(.unexpectedError))
            }
            Logger.log(error)
        }
    }
}

extension NetworkService {
    
    private static func defaultSession() -> URLSession {
        return URLSession(configuration: .ephemeral)
    }
}
