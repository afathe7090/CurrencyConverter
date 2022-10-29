//
//  RatedNetworkProvider.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import RxSwift
import Moya

protocol RatedNetworkProviding {
    func readRatedCurrecy() -> Observable< RatedCurrencyModel >
}

class RatedNetworkProvider: RatedNetworkProviding {
    
    private let provider = MoyaProvider<RatedNetworkServices>()
    
    
    func readRatedCurrecy() -> Observable< RatedCurrencyModel > {
    provider.rx.request(.ratedCurrency)
            .filterSuccessfulStatusCodes()
            .map(RatedCurrencyModel.self)
            .asObservable()
    }
    
}
