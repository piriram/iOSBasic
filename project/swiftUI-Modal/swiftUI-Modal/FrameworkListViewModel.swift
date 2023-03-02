//
//  FrameworkListViewModel.swift
//  swiftUI-Modal
//
//  Created by ram on 2023/03/02.
//

import Foundation

final class FrameworkListViewModel: ObservableObject{
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem:AppleFramework?
    
}
