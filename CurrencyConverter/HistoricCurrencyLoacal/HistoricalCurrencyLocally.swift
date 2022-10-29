//
//  HistoricalCurrencyLocally.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import UIKit



class HistoricalCurrencyLocally {
    
    
    static let instance = HistoricalCurrencyLocally()
    private let db = UserDefaults.standard
    private var historicalShared: [Currency] = []
    
    private init (){
        // Fetch histoticalShard
        fetchOldHistorical()
    }
    
    
    func saveCurrencyRestult(_ currency: Currency){
        historicalShared.insert(currency, at: 0)
        let encodeCurrency = JSONEncoder()
        let dataEncoding = try? encodeCurrency.encode(historicalShared)
        db.set(dataEncoding, forKey: String(describing: Currency.self))
        db.synchronize()
        print("Saved Currency Done \(currency)")
    }
    
    
    func getHistoricalCurrencyResults()-> [Currency]? {
        let jsonDecoder = JSONDecoder()
        guard let data = db.value(forKey: String(describing: Currency.self)) as? Data else {return nil}
        let historicalCUrrency =  try? jsonDecoder.decode([Currency].self, from: data)
        return historicalCUrrency?.uniqued()
    }
    
    
    private func fetchOldHistorical(){
        if let currencies = getHistoricalCurrencyResults()  {
            historicalShared = currencies
            print("All Historical Currencies is :\(historicalShared)")
        }
    }
}

