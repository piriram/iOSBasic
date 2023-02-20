//
//  StockRankSwiftUIApp.swift
//  StockRankSwiftUI
//
//  Created by ram on 2023/02/20.
//

import SwiftUI

@main
struct StockRankSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            StockRankView()
                .preferredColorScheme(.dark)
        }
    }
}
