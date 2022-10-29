//
//  ChartInjection.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 29/10/2022.
//

import Foundation
import Resolver


extension Resolver {
    
    static func chartInjection(){
        
        register {
            RatedCurrencyRepoImple()
        }.implements(RatedCurrencyRepo.self)
        
        register {
            RatedCurrencyUseCase()
        }
        
        register {
            RatedCurrencyModel()
        }.implements(RatedCurrencyViewModelProtocol.self)
        
        register {
            RatedCurrecnctViewController()
        }
    }
    
}