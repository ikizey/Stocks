//
//  Stock.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
