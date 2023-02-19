//
//  ContentView.swift
//  AppleFrameworkSwiftUI
//
//  Created by ram on 2023/02/20.
//

import SwiftUI

struct FrameWorkListView: View {
    @State var list: [AppleFramework]
    = AppleFramework.list
    let layout: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible()),
    ]
    
    var body: some View {
        //그리드 만들기
        //UIKit : UICollectionView
        //Data,Presentation,Layout
        //SwiftUI:LazyGrid, LazyHGrid
        
        
    
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout){
                    ForEach(list,id:\.self) { item in
                        FrameworkCell(framework: item)
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("🔥 Apple Framework"  )
        }
    }
}

struct FrameWorkListView_Previews: PreviewProvider {
    static var previews: some View {
        FrameWorkListView()
            
    }
}
