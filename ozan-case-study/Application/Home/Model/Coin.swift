//
//  Coin.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

struct CoinsResponse: Decodable {
    let status: String
    let data: ResponseData

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

extension CoinsResponse {
    
    static let successfulResponse = CoinsResponse(
        status: "success",
        data: ResponseData(coins: [.mockCoin])
    )
    
    static let emptyResponse = CoinsResponse(
        status: "success",
        data: ResponseData(coins: [])
    )
}

struct ResponseData: Decodable {
    let coins: [Coin]

    enum CodingKeys: String, CodingKey {
        case coins = "coins"
    }
}

struct Coin: Decodable {
    let uuid: String
    let symbol: String
    let name: String
    let iconURL: String
    let price: String
    let listedAt: Int
    let change: String
//    let sparkline: [String]
    let the24HVolume: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case symbol = "symbol"
        case name = "name"
        case iconURL = "iconUrl"
        case price = "price"
        case listedAt = "listedAt"
        case change = "change"
//        case sparkline = "sparkline"
        case the24HVolume = "24hVolume"
    }
}

extension Coin {
    static let mockCoin = Coin(
        uuid: "Qwsogvtv82FCd",
        symbol: "BTC",
        name: "Bitcoin",
        iconURL: "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg",
        price: "56373.67522635439",
        listedAt: 1330214400,
        change: "-3.61",
        the24HVolume: "39591261551"
    )
}
