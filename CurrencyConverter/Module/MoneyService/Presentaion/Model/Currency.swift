//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation


struct Currency: Codable, Hashable{
    let date: String
    let result: Double
    let query: Query?
}

struct Query: Codable, Hashable {
    let amount: Double
    let from:  String
    let to: String
}

