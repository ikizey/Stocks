//
//  ContentView.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        
        stockListViewModel.load()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("Aug 1 2021")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -250)
                
                SearchView(searchTerm: $stockListViewModel.searchTerm)
                    .offset(y: -200)
                
                StockListView(stocks: stockListViewModel.stocks)
                    .offset(y: -90)
                
                ArticleView(articles: stockListViewModel.articles, onDragBegin: { value in
                    stockListViewModel.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < 0 {
                        stockListViewModel.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        stockListViewModel.dragOffset = CGSize(width: 0, height: 560)
                    }
                })
                .animation(.spring())
                .offset(y: stockListViewModel.dragOffset.height)
            }
                .navigationTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
