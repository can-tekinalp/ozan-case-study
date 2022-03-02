//
//  CoinListViewModel.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

final class CoinListViewModel {
    
    private(set) var coinCellViewModels: [CoinCellViewModel]
    
    init(coinList: [Coin]) {
        coinCellViewModels = coinList.map { CoinCellViewModel(coin: $0) }
    }
    
    var numberOfCells: Int {
        return coinCellViewModels.count
    }
    
    func cellViewModel(for row: Int) -> CoinCellViewModel? {
        return coinCellViewModels[safe: row]
    }
    
    func sort(by type: CoinSortType) {
        switch type {
        case .price:
            coinCellViewModels.sortByPrice()
        case .change:
            coinCellViewModels.sortByChange()
        }
    }
}

extension Array where Element == CoinCellViewModel {
    
    mutating func sortByPrice() {
        sort { $0.coin.priceAsDouble > $1.coin.priceAsDouble }
    }
    
    mutating func sortByChange() {
        sort { $0.coin.changeAsDouble > $1.coin.changeAsDouble }
    }
}
