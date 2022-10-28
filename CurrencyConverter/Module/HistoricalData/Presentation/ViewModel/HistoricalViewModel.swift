//
//  HistoricalViewModel.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import Foundation


protocol HistoricalViewModelProtocol {
    var input: HistoricalViewModel.Input { get  set }
    var output: HistoricalViewModel.Output { get set }
}


class HistoricalViewModel: HistoricalViewModelProtocol , ViewModel{
    
    class Input{
        
    }
    
    class Output {
        
    }
    
    var input: Input = .init()
    var output: Output = .init()
    
    
    init() {
        
    }
    
    
}
