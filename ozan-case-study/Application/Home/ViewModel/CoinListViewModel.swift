//
//  CoinListViewModel.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

final class CoinListViewModel {
    
    private let coinCellViewModels: [CoinCellViewModel]
    
    init(coinList: [Coin]) {
        coinCellViewModels = coinList.map { CoinCellViewModel(coin: $0) }
    }
    
    var numberOfCells: Int {
        return coinCellViewModels.count
    }
    
    func cellViewModel(for row: Int) -> CoinCellViewModel? {
        return coinCellViewModels[safe: row]
    }
}
