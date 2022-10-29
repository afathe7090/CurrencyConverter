//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation


struct Currency: Codable, Hashable{
    var date: String
    var result: Double
    var query: Query?
}

struct Query: Codable, Hashable {
    var amount: Double
    var from:  String
    var to: String
}

