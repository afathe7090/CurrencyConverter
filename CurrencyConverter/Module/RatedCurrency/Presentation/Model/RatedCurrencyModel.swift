//
//  ChartModel.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation



struct RatedCurrencyModel: Codable {
    let base, date: String
    let rates: [String: Double]
    
}
