//
//  ChartUseCase.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import Resolver
import RxSwift

class RatedCurrencyUseCase{
    
    @Injected private var repo: RatedCurrencyRepo
    
    func ratesCurrency() -> Observable<RatedCurrencyModel> {
        return repo.ratesCurrency()
    }
    
    func ratesCurrencySymbolesValue() -> Observable<[String: Double]>{
        ratesCurrency().compactMap { rated -> [String: Double] in
            rated.rates
        }
    }
    
}
