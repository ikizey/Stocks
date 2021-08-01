//
//  Webservice.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import Foundation

class Webservice {
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
    let urlString = "https://island-bramble.glitch.me/stocks"
        guard let url = URL(string: urlString) else {
            fatalError("Wrong URL!")}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion (stocks)
        }.resume()
    }
}
