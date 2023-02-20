//
//  StockModel.swift
//  StockRankSwiftUI
//
//  Created by ram on 2023/02/20.
//

import Foundation


struct StockModel:Hashable,Identifiable { //헤셔블은 각 데이터가 구분 가능한지
    var id: String {
        return name
    }
    let rank: Int
    let imageName: String
    let name: String
    let price: Int
    let diff: Double
}

extension StockModel {
    static let list: [StockModel] = [
        StockModel(rank: 1, imageName: "TSLA", name: "테슬라", price: 1_238_631, diff: -0.08),
        StockModel(rank: 2, imageName: "AAPL", name: "애플", price: 238_631, diff: 0.14),
        StockModel(rank: 3, imageName: "NFLX", name: "넷플릭스", price: 438_631, diff: -0.08),
        StockModel(rank: 4, imageName: "GOOG", name: "알파벳 A", price: 3_176_631, diff: 0.12),
        StockModel(rank: 5, imageName: "AMZN", name: "아마존", price: 3_538_631, diff: 0.06),
        StockModel(rank: 6, imageName: "NIKE", name: "나이키", price: 158_631, diff: 0.7),
        StockModel(rank: 7, imageName: "DIS", name: "디즈니", price: 138_631, diff: 0.09),
        StockModel(rank: 8, imageName: "TSLA", name: "테슬라", price: 1_238_631, diff: -0.04),
        StockModel(rank: 9, imageName: "AAPL", name: "애플", price: 238_631, diff: 0.09),
        StockModel(rank: 10, imageName: "NFLX", name: "넷플릭스", price: 438_631, diff: -0.08),
        StockModel(rank: 11, imageName: "GOOG", name: "알파벳 A", price: 3_176_631, diff: 0.02),
        StockModel(rank: 12, imageName: "AMZN", name: "아마존", price: 3_538_631, diff: 0.01),
        StockModel(rank: 13, imageName: "NIKE", name: "나이키", price: 158_631, diff: 0.02),
        StockModel(rank: 14, imageName: "DIS", name: "디즈니", price: 138_631, diff: 0.03),
    ]
}
