//
//  NetworkTarget.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation
import Moya
import RxSwift

enum FixorServices{
    case symbols
    case convert(String,String,String)
}

extension FixorServices: TargetType{
    var baseURL: URL {
        return URL(string: FixorConst.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .symbols:
            return FixorConst.symbolsPath
        case .convert(_, _, _):
            return FixorConst.convertPath
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self{
        case .symbols:
            return .requestPlain
        case .convert(let to,let from, let  amount):
            return .requestParameters(parameters: [FixorConst.toQuery:to
                                                   ,FixorConst.fromQuery:from
                                                   ,FixorConst.amountQuery :Double(amount) as Any], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return FixorConst.headers
    }
    
    
}
