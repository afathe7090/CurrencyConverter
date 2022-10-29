//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation


struct Currency: Codable{
    let date: String
    let result: Double
    let query: Query?
}

struct Query: Codable {
    let amount: Double
    let from:  String
    let to: String
}

