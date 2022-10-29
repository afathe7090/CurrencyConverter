//
//  HistoricalViewModel.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import Foundation
import Resolver
import RxSwift
import RxCocoa


protocol HistoricalViewModelProtocol {
    var input: HistoricalViewModel.Input { get  set }
    var output: HistoricalViewModel.Output { get set }
    func viewDidLoad()
}


class HistoricalViewModel: HistoricalViewModelProtocol , ViewModel{
    
    class Input{
        
    }
    
    class Output {
        var historicalPublisher: PublishSubject<[Currency]> = .init()
    }
    
    var input: Input = .init()
    var output: Output = .init()
    
    private let useCase: HistoricalUseCase = Resolver.resolve()
    
    init() {
        
    }
    
    func viewDidLoad(){
        fetchHistoricalUserCurrency()
    }
    
    fileprivate func fetchHistoricalUserCurrency(){
        if let histroricalData = HistoricalCurrencyLocally.instance.getHistoricalCurrencyResults() {
            output.historicalPublisher.onNext(histroricalData)
        }else {
            print("NO Currency Converted Done...")
        }
    }
    
}
