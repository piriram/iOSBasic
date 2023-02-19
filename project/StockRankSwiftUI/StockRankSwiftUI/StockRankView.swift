//
//  StockRankView.swift
//  StockRankSwiftUI
//
//  Created by ram on 2023/02/20.
//

import SwiftUI

struct StockRankView: View {
    @State var list = StockModel.list
    var body: some View {
        List(list,id:\.self){item in
            //id구분자 Identifiable를 써야한다.
            //UUID를 사용할 수도 있다.
            StockRankRow(stock: item)
                .listRowInsets(EdgeInsets(top:0,
                                         leading: 0,
                                         bottom: 0,
                                         trailing: 0))
                .frame(height:80)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .background(.black)
        //리스트는 디자인이 되어있음
        
//        ScrollView{
//            ForEach(list,id:\.self){stock in
//                StockRankRow(stock:stock)
//                //스크롤이 안되고 사이에 스페이스가 생김
//                //VStack->ScrollView
//                //ScrollView는 데이터가 적고 정적일 때
//                //이 데이터는 몇개가 들어올 지 모르므로
//                //유연하게 대응할 수 있어야함
//                //재사용성을 높여보자
//
//            }
            
//        }
//        .background(.black)
    }
}

struct StockRankView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
    }
}
