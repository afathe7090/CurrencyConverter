//
//  ChartInjection.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import Resolver


extension Resolver {
    
    static func ratedCurrencyInjection(){
        
        register {
            RatedCurrencyRepoImple()
        }.implements(RatedCurrencyRepo.self)
        
        register {
            RatedCurrencyUseCase()
        }
        
        register {
            RatedCurrencyViewModel()
        }.implements(RatedCurrencyViewModelProtocol.self)
        
        register {
            RatedCurrecnctViewController()
        }
    }
    
}
