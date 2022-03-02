//
//  CoinCellViewModel.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import UIKit

final class CoinCellViewModel {
    
    let coin: Coin
    
    var symbolText: String {
        return coin.symbol
    }
    
    var nameText: String {
        return coin.name
    }
    
    var formattedPriceText: String {
        return Formatters.priceFormatter.string(from: coin.priceAsDouble.nsNumber) ?? ""
    }
    
    var changeText: NSAttributedString {
        let color: UIColor = coin.changeAsDouble >= 0 ? .lightishGreen : .duskOrange
        return NSAttributedString(
            string: "\(coin.change)%",
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
    }
    
    init(coin: Coin) {
        self.coin = coin
    }
}
