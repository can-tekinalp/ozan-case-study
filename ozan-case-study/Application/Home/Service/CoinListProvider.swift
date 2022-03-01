//
//  CoinListProvider.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

extension String: Error { }

protocol CoinListProviding {
    typealias CoinListFetchedHandler = (Result<CoinsResponse, String>) -> Void
    func fetchCoinList(_ completionHandler: CoinListFetchedHandler?)
}

class CoinListProvider: CoinListProviding {
    
    private let service: NetworkService
    
    init(service: NetworkService = .shared) {
        self.service = service
    }
    
    func fetchCoinList(_ completionHandler: CoinListFetchedHandler?) {
        service.request(decodable: CoinsResponse.self, router: CoinApiRouter.getCoinList, parameters: [:]) { result in
            completionHandler?(result.transformNetworkResult())
        }
    }
}
