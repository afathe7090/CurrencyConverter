//
//  MoneyService.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 27/10/2022.
//

import Foundation
import RxSwift

protocol MoneyServiceRepo{
    func symbols()-> Observable<[String]>
    func convertCurrency(to: String, from: String, amount: String) -> Observable<Currency>
}
