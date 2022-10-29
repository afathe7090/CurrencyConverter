//
//  MoneyServiceImple.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation
import RxSwift
import Resolver

class MoneyServiceRepoImple: MoneyServiceRepo {
    
    @Injected private var provider: NetworkProviding
    
    init(){ }
    
    func convertCurrency(to: String, from: String, amount: String) -> Observable<Currency> {
        return provider.convertCurrency(to: to, from: from, amount: amount)
    }
    
    func symbols() -> Observable<[String]> {
        return provider.symbols()
    }
    
    
}
