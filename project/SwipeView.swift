//
//  ContentView.swift
//  MarketGo
//
//  Created by ram on 2023/03/27.
//

import SwiftUI

struct MarketInfo: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let phoneNumber: String
    let description: String
}

struct TouristAttraction: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}



struct ContentView: View {
    
    let market = MarketInfo(name: "동문시장", location: "대한민국 서울특별시 종로구 창경궁로 288", phoneNumber: "02-123-4567", description: "서울의 대표적인 전통 시장")
    
    let attractions = [
        TouristAttraction(name: "경복궁", description: "조선시대 왕궁 유적지"),
        TouristAttraction(name: "창덕궁", description: "조선시대 왕궁 유적지"),
        TouristAttraction(name: "종묘", description: "조선시대 왕릉 유적지"),
        TouristAttraction(name: "북촌한옥마을", description: "한옥 거리"),
    ]
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Text(market.name)
                .font(.largeTitle)
                .padding(.top)
            
            Image("market")
                .resizable()
                .scaledToFit()
            
            TabView(selection: $selectedTab) {
                VStack {
                    Text("위치: \(market.location)")
                    Text("전화번호: \(market.phoneNumber)")
                    Text("설명: \(market.description)")
                }
                .tag(0)
                
                List(attractions) { attraction in
                    VStack(alignment: .leading) {
                        Text(attraction.name)
                            .font(.headline)
                        Text(attraction.description)
                            .font(.subheadline)
                    }
                }
                .tag(1)
                
                MarketInfoView()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
