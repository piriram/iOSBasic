//
//  StockRankViewModel.swift
//  StockRankSwiftUI
//
//  Created by ram on 2023/02/21.
//

import Foundation

final class StockRankViewModel: ObservableObject{
    @Published var models: [StockModel]=StockModel.list
    
    var numOfFavorites: Int {
        let favoriteStocks = models.filter{ $0.isFavorite }
        return favoriteStocks.count
    }
    
}
