//
//  RatedNetworkServices.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import Moya

enum RatedNetworkServices{
    case ratedCurrency
}


extension RatedNetworkServices: TargetType{
    var baseURL: URL {
        return URL(string: FixorConst.baseUrl)!
    }
    
    var path: String {
        return FixorConst.fixorPath + "/2022-10-29"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestParameters(parameters: ["base": FixorConst.baseRated , "symbols": FixorConst.symbols], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return FixorConst.headers
    }
    
    
}
