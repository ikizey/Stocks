//
//  StockListView.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        VStack{
            ForEach(stocks, id: \.symbol) { stock in
                StockCellView(stock: stock)
                
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(Color.black)
        }
    }
}


struct StockListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let stock = Stock(symbol: "GOOG", description: "Google", price: 1000, change: "+0.23")
        let stocka = Stock(symbol: "AAPL", description: "Apple", price: 2000, change: "-0.40")
        return StockListView(stocks: [StockViewModel(stock: stock), StockViewModel(stock: stocka)])
            .previewLayout(.sizeThatFits)
    }
}
