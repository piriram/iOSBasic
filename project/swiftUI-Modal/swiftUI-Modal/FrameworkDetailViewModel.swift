//
//  FrameworkDetailViewModel.swift
//  swiftUI-Modal
//
//  Created by ram on 2023/03/02.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: Binding<AppleFramework>
    
    init(framework: Binding<AppleFramework>){
        self.framework = framework
    }
}
