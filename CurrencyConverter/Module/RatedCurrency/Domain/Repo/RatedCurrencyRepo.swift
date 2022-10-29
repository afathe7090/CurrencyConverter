//
//  ChartRepo.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import RxSwift

protocol RatedCurrencyRepo {
    func ratesCurrency()-> Observable<RatedCurrencyModel>
}
