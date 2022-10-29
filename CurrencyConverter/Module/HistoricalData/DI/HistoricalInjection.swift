//
//  HistoricalInjection.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import Resolver


extension Resolver{
    
    
    static func historicalInjection() {
        
        register {
            HistoricalRepoImple()
        }.implements(HistoricalRepo.self)
        
        register {
            HistoricalUseCase()
        }
        
        register {
            HistoricalViewModel()
        }.implements(HistoricalViewModelProtocol.self)
        
        
        register {
            HistoricalViewController()
        }
        
    }
    
}
