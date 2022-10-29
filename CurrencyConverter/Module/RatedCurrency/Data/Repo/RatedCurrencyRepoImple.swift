//
//  ChartRepoImple.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import RxSwift
import Resolver

class RatedCurrencyRepoImple: RatedCurrencyRepo {
    
    
    @Injected private var provider: RatedNetworkProviding
    
    
    func ratesCurrency() -> Observable<RatedCurrencyModel> {
        return provider.readRatedCurrecy()
    }
    
}
