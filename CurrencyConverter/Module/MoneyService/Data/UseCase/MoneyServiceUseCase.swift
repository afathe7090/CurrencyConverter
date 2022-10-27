//
//  MoneyServiceUseCase.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation
import RxSwift

class MoneyServiceUseCase {
    
    
    private let repo: MoneyServiceRepo!
    
    init(repo: MoneyServiceRepo = MoneyServiceImple()) {
        self.repo = repo
    }
    
    func convertCurrency(to: String, from: String, amount: String) -> Observable<Currency>{
        return repo.convertCurrency(to: to, from: from, amount: amount)
    }
    
    
    func symbols()-> Observable<[String]> {
        return repo.symbols()
    }
    
}
