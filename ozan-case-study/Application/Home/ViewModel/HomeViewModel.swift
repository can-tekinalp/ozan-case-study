//
//  HomeViewModel.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import Foundation

final class HomeViewModel {
    
    private let coinListProviding: CoinListProviding
    
    var coinListViewModel: CoinListViewModel?
    var stateChangedHandler: ((HomeViewModel.States) -> Void)?
    
    init(coinListProviding: CoinListProviding) {
        self.coinListProviding = coinListProviding
    }
    
    func fetchList() {
        stateChangedHandler?(.loading(true))
        coinListProviding.fetchCoinList { [weak self] result in
            self?.stateChangedHandler?(.loading(false))
            self?.handleListFetched(result)
        }
    }
    
    private func handleListFetched(_ result: Result<CoinsResponse, String>) {
        switch result {
        case .success(let response):
            if response.data.coins.isEmpty {
                stateChangedHandler?(.receivedEmptyList)
                return
            }
            coinListViewModel = CoinListViewModel(coinList: response.data.coins)
            stateChangedHandler?(.receivedList)
        case .failure(let errorMessage):
            stateChangedHandler?(.receivedError(errorMessage))
        }
    }
}

extension HomeViewModel {
    
    enum States {
        case loading(Bool)
        case receivedError(String)
        case receivedList
        case receivedEmptyList
    }
}

extension HomeViewModel {
    
    var numberOfCells: Int {
        return coinListViewModel?.numberOfCells ?? 0
    }
    
    func cellViewModel(for row: Int) -> CoinCellViewModel? {
        return coinListViewModel?.cellViewModel(for: row)
    }
}
