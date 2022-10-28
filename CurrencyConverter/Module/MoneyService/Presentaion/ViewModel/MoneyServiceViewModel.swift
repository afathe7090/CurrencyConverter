//
//  MoneyServiceViewModel.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import Foundation
import RxSwift
import RxCocoa
import Resolver

protocol ViewModel{
    associatedtype Input
    associatedtype Output
}

protocol MoneyServiceViewModelProtocol{
    var input: MoneyServiceViewModel.Input { get  set }
    var output: MoneyServiceViewModel.Output { get set }
    func viewDidLoad()
    func combineFromToFields()-> Observable<(String, String)>
}


class MoneyServiceViewModel: MoneyServiceViewModelProtocol ,ViewModel {
    
    class Input {
        var amountBehavior: BehaviorRelay< String > = .init(value: "1")
        var fromCurrencySymbolBehavior: BehaviorRelay<String> = .init(value: "")
        var toCurrencySymbolBehavior: BehaviorRelay<String> = .init(value: "")
        var swipCurrencyChange: PublishSubject<Void> = .init()
    }
    
    class  Output{
        var resultCurrenyPublisher: PublishSubject<Currency> = .init()
        var currencySymbolsBehavior: BehaviorRelay<[String]> = .init(value: [])
    }
    
    var input: Input = .init()
    var output: Output = .init()
    
    private let bag = DisposeBag()
    private let useCase: MoneyServiceUseCase = Resolver.resolve()
    
    init(){ }
    
    func viewDidLoad(){
        fetchResult()
        currencySymbolsRequest()
        swipCurrencySymbols()
    }
    
    func combineFromToFields()-> Observable<(String, String)>{
        Observable.combineLatest(input.fromCurrencySymbolBehavior.asObservable()
                                 ,input.toCurrencySymbolBehavior.asObservable())
    }
    
    fileprivate func swipCurrencySymbols(){
        input.swipCurrencyChange
            .throttle(RxTimeInterval.seconds(2),
                      scheduler: MainScheduler.instance)
            .subscribe(onNext: {[weak self] _ in
                guard let self = self else {return}
                let toValue = self.input.toCurrencySymbolBehavior.value
                let fromValue = self.input.fromCurrencySymbolBehavior.value
                self.input.fromCurrencySymbolBehavior.accept(toValue)
                self.input.toCurrencySymbolBehavior.accept(fromValue)
            }).disposed(by: bag)
    }
    
    // Subscribe to Amount Value
    fileprivate func fetchResult(){
        Observable.combineLatest(input.amountBehavior.asObservable()
                                 ,input.fromCurrencySymbolBehavior.asObservable()
                                 ,input.toCurrencySymbolBehavior.asObservable())
            .filter({
                return !$0.isEmpty && !$1.isEmpty && !$2.isEmpty && $1 != $2
            }).subscribe(onNext: { [weak self ] (amount , fromCurrency, toCurrency) in
                guard let self = self else { return }
                self.requestWithAmount(amount, fromCurrenct: fromCurrency, toCurrency: toCurrency)
            }).disposed(by: bag)
    }
    
    // Synols from api to present in picker view
    fileprivate func currencySymbolsRequest(){
        useCase.symbols().subscribe(onNext: {[weak self] symbols in
            guard let self = self else {return}
            self.output.currencySymbolsBehavior.accept(symbols)
        }).disposed(by: bag)
    }
    
    // Fetch Request With amount
    fileprivate func requestWithAmount(_ amount: String, fromCurrenct: String , toCurrency: String){
        useCase.convertCurrency(to: toCurrency, from: fromCurrenct, amount: amount)
            .subscribe(onNext: { [weak self] current in
                guard let self = self else {return}
                self.output.resultCurrenyPublisher.onNext(current)
            }).disposed(by: bag)
    }
    
    
}

