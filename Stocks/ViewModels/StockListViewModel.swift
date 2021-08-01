//
//  StockListViewModel.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {

    @Published var dragOffset = CGSize(width: 0, height: 560)
    @Published var searchTerm = ""
    @Published var stocks = [StockViewModel]()
    @Published var articles = [ArticleViewModel]()
    
    func load() {
        fetchArticles()
        fetchStocks()
    }
    
    private func fetchArticles() {
        Webservice().getTopNews { articles in
            guard let articles = articles else { return }
            self.articles = articles.map(ArticleViewModel.init)
        }
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            guard let stocks = stocks else { return }
            self.stocks = stocks.map(StockViewModel.init)
        }
    }
}
