//
//  MoneyServiceInjection.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation
import Resolver


extension Resolver {
    static func moneyServiceInjection(){
        
        
        register { MoneyServiceRepoImple() }
        .implements(MoneyServiceRepo.self)
        
        register { MoneyServiceUseCase() }
        
        register { MoneyServiceViewModel()
        }.implements(MoneyServiceViewModelProtocol.self)
        
        register {
            MoneyServiceViewController()
        }
        
        
    }
}
