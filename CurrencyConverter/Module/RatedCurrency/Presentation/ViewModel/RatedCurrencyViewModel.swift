//
//  ChartVIewModel.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 29/10/2022.
//

import Foundation
import RxSwift
import Resolver

protocol RatedCurrencyViewModelProtocol{
    var input: RatedCurrencyViewModel.Input { get set }
    var output: RatedCurrencyViewModel.Output { get set }
}



class RatedCurrencyViewModel: RatedCurrencyViewModelProtocol, ViewModel{
    
    class Input{
        
    }
    
    class Output{
        
    }
    
    var input: Input = .init()
    var output: Output = .init()
        
    private let useCase: RatedCurrencyUseCase = Resolver.resolve()
    
    
    func viewDidLoad(){
        
    }
    
}
