//
//  MoneyServiceImple.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation
import RxSwift

class MoneyServiceImple: MoneyServiceRepo {
    
        
    private let provider: NetworkProviding
    
    init(provider: NetworkProviding = NetworkProvider()){
        self.provider = provider
    }
    
    
    func convertCurrency(to: String, from: String, amount: String) -> Observable<Currency> {
        return provider.convertCurrency(to: to, from: from, amount: amount)
    }
    
    func symbols() -> Observable<[String]> {
        return provider.symbols()
    }
    
    
    
}
