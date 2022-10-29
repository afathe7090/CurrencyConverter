//
//  ChartVIewModel.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import Foundation
import RxSwift
import Resolver

protocol RatedCurrencyViewModelProtocol{
    var input: RatedCurrencyViewModel.Input { get set }
    var output: RatedCurrencyViewModel.Output { get set }
    func viewDidLoad()
}



class RatedCurrencyViewModel: RatedCurrencyViewModelProtocol, ViewModel{
    
    class Input{
        
    }
    
    class Output{
        var ratedCurency: PublishSubject<[String: Double]> = .init()
    }
    
    var input: Input = .init()
    var output: Output = .init()
    private let bag = DisposeBag()
    
    private let useCase: RatedCurrencyUseCase = Resolver.resolve()
    
    
    func viewDidLoad(){
        ratedCurrencySymoblesObservalbe()
    }
    
    
    fileprivate func ratedCurrencySymoblesObservalbe(){
        useCase.ratesCurrencySymbolesValue().subscribe(onNext: { [weak self] rated in
            guard let self = self else { return }
            self.output.ratedCurency.onNext(rated)
        }).disposed(by: bag)
    }
    
}
