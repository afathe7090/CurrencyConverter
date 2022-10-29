//
//  FixorInjectionNetwork.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 28/10/2022.
//

import Foundation
import Resolver

extension Resolver {
    
    static func networkINjection(){
        register {
            NetworkProvider()
        }.implements(NetworkProviding.self)
        
    }
    
}
