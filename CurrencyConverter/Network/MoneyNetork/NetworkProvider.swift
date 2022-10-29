//
//  NetworkProvider.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation
import RxSwift
import Moya

protocol NetworkProviding {
    func symbols()-> Observable< [String] > 
    func convertCurrency(to: String, from: String, amount: String) -> Observable<Currency>
}


class NetworkProvider: NetworkProviding{
    
    private let provider = MoyaProvider<FixorServices>()
    
    
    func convertCurrency(to: String, from: String, amount: String) -> Observable<Currency> {
        provider.rx.request(.convert(to, from, amount))
            .filterSuccessfulStatusCodes()
            .map(Currency.self)
            .asObservable()
    }
    
    func symbols()-> Observable< [String] > {
         provider.rx
            .request(.symbols).filterSuccessfulStatusCodes()
            .map(Symbols.self)
            .asObservable()
            .compactMap { symols -> [String] in
                symols.symbols.keys.map({$0})
            }
    }
    
}
