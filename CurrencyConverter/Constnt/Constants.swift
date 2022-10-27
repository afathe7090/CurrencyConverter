//
//  Constants.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation

enum FixorConst {
    static let baseUrl: String = "https://api.apilayer.com"
    static let symbolsPath: String =  "/fixer/symbols"
    static let convertPath: String = "/fixer/convert"
    static let headers = ["apikey": "EXuAGtwZWsoIKCiw25CR6upo2XmASSih"]
    
    static let toQuery: String = "to"
    static let fromQuery: String = "from"
    static let amountQuery: String = "amount"
    
}
