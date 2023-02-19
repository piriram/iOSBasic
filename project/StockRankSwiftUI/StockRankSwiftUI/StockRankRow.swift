//
//  StockRankRow.swift
//  StockRankSwiftUI
//
//  Created by ram on 2023/02/20.
//

import SwiftUI

struct StockRankRow: View {
    var stock: StockModel
    var body: some View {
        HStack{
            Text("\(stock.rank)")
                .font(.system(
                size: 16,
                weight: .bold))
                .frame(width: 30)
                .foregroundColor(.blue)
            Image("\(stock.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            
            VStack(alignment: .leading){
                Text("\(stock.name)")
                    .font(.system(size: 12))
                    
                HStack{
                    Text("\(stock.price)원")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text("\(stock.diff,specifier: "%.2f") %")
                        .font(.system(size: 12))
                        .foregroundColor(
                            stock.diff>0 ?.blue: .red)
                        
                    
                }
            }
            Spacer()
            Image(systemName: "heart.fill")
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth:.infinity,
               maxHeight: .infinity)
        .background(.black)
        .foregroundColor(.white)
        
    
    }
}

struct StockRankRow_Previews: PreviewProvider {
    static var previews: some View {
        StockRankRow(stock: StockModel.list[0])
    }
}
