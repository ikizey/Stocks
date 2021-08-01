//
//  StockCellView.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import SwiftUI

struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Text(stock.description)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                Text(stock.price)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                Button(stock.change) {}
                    .frame(width: 75)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(6)
            }
        }.background(Color.black)
    }
}

struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "GOOG", description: "Google", price: 1000, change: "+0.23")
        StockCellView(stock: StockViewModel(stock: stock))
            .previewLayout(.sizeThatFits)
    }
}
