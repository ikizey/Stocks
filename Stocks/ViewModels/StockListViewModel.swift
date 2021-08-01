//
//  StockListViewModel.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import Foundation

class StockListViewModel: ObservableObject {

    var searchTerm = ""
    @Published var stocks = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            guard let stocks = stocks else { return }
            DispatchQueue.main.async {
                self.stocks = stocks.map(StockViewModel.init)
            }
        }
    }
}
