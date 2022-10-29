//
//  MoneyServiceUseCase.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation
import RxSwift
import Resolver

class MoneyServiceUseCase {
    
    
    @Injected private var repo: MoneyServiceRepo
    
    init() { }
    
    func convertCurrency(to: String, from: String, amount: String) -> Observable<Currency>{
        return repo.convertCurrency(to: to, from: from, amount: amount)
    }
    
    func symbols()-> Observable<[String]> {
        return repo.symbols()
    }
    
}
