//
//  Constants.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation

enum FixorConst {
    static let baseUrl: String = "https://api.apilayer.com"
    static let fixorPath: String = "/fixer"
    static let symbolsPath: String =   fixorPath + "/symbols"
    static let convertPath: String = fixorPath + "/convert"
    static let headers = ["apikey": "zKcdZB7myNaLChhTJx7XLq5iYj0vxvWs"]
    
    static let toQuery: String = "to"
    static let fromQuery: String = "from"
    static let amountQuery: String = "amount"
    
    
    static let baseRated: String = "GBP"
    static let symbols: String =
    "RWF,"
    + "SAR"
    + ",SBD"
    + ",SCR"
    + ",SDG"
    + ",SEK"
    + ",SGD"
    + ",SHP"
    + ",SLL"
    
}
