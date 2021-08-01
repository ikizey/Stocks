//
//  StockViewModel.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import Foundation

struct StockViewModel {
    
    let stock: Stock
    
    var symbol: String {
        stock.symbol.uppercased()
    }
    
    var description: String {
        stock.description
    }
    
    var price: String {
        String(format: "%.2f", stock.price)
    }
    
    var change: String {
        stock.change
    }
}
