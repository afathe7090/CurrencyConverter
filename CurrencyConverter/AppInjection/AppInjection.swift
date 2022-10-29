//
//  File.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering{
    public static func registerAllServices() {
        
        networkINjection()
        
        moneyServiceInjection()
        
        historicalInjection()
        
        chartInjection()
    }
}
