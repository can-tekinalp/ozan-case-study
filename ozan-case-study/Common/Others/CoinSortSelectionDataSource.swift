//
//  CoinSortSelectionDataSource.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

final class CoinSortSelectionDataSource: PickerDataSource {
    
    let cases = CoinSortType.allCases
    
    var titles: [String] {
        return cases.map { $0.rawValue }
    }
    
    func sortType(for title: String) -> CoinSortType {
        return CoinSortType(rawValue: title)!
    }
}
