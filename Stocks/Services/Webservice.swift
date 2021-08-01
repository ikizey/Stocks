//
//  Webservice.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import Foundation

class Webservice {
    
    func getTopNews(completion: @escaping (([Article]?) -> Void)) {
        let urlString = "https://island-bramble.glitch.me/top-news"
        guard let url = URL(string: urlString) else {
            fatalError("Wrong URL!")}

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }.resume()
    }
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        let urlString = "https://island-bramble.glitch.me/stocks"
        guard let url = URL(string: urlString) else {
            fatalError("Wrong URL!")}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
        }.resume()
    }
}
