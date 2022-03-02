//
//  HomeViewModel.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import Foundation

final class HomeViewModel {
    
    private let coinListProviding: CoinListProviding
    let pickerDataSource: PickerDataSource
    private var selectedSortOption: CoinSortType = .price
    var coinListViewModel: CoinListViewModel?
    var stateChangedHandler: ((HomeViewModel.States) -> Void)?
    
    init(coinListProviding: CoinListProviding, pickerDataSource: PickerDataSource) {
        self.coinListProviding = coinListProviding
        self.pickerDataSource = pickerDataSource
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
            coinListViewModel?.sort(by: selectedSortOption)
            stateChangedHandler?(.receivedList)
        case .failure(let errorMessage):
            stateChangedHandler?(.receivedError(errorMessage))
        }
    }
    
    func selectionChanged(index: Int) {
        let title = pickerDataSource.titleFor(row: index)!
        let sortType = CoinSortType(rawValue: title)!
        if sortType != selectedSortOption {
            selectedSortOption = sortType
            handleSortOptionChanged()
        }
    }
    
    private func handleSortOptionChanged() {
        coinListViewModel?.sort(by: selectedSortOption)
        stateChangedHandler?(.changedSortingType)
    }
}

extension HomeViewModel {
    
    enum States {
        case loading(Bool)
        case receivedError(String)
        case receivedList
        case receivedEmptyList
        case changedSortingType
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
