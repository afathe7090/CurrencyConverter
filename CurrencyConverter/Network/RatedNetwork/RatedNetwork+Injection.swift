//
//  RatedNetwork+Injection.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 29/10/2022.
//

import Foundation
import Resolver

extension Resolver {
    
    static func ratedNetworkInjection(){
        
        register {
            RatedNetworkProvider()
        }.implements(RatedNetworkProviding.self)
        
        
    }
    
}
