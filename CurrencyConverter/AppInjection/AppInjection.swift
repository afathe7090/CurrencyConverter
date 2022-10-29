//
//  File.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering{
    public static func registerAllServices() {
        
        networkINjection()
        ratedNetworkInjection()
        
        moneyServiceInjection()
        
        historicalInjection()
        
        ratedCurrencyInjection()
    }
}
