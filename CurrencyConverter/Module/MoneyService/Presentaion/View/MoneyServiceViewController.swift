//
//  MoneyServiceViewController.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 27/10/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Resolver

class MoneyServiceViewController: UIViewController {
   
    @Injected private var viewModel: MoneyServiceViewModelProtocol
    private let bag = DisposeBag()
    
    // MARK: - OutLets
    @IBOutlet weak var flipFromToBtn: UIButton!{ didSet {flipFromToBtn.layer.cornerRadius = 25}}
    @IBOutlet weak var resultBackView: UIView! { didSet { resultBackView.layer.cornerRadius = 10}}
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var currencyCountTextField: UITextField!
    @IBOutlet weak var toCurrencySymbolsField: UITextField!
    @IBOutlet weak var fromCurrencySymbolsField: UITextField!
    
    @IBOutlet weak var detailsBtn: UIButton!
    private let fromPickerView = UIPickerView()
    private let toPickerView = UIPickerView()

    
    
    //=======>MARK: -  Life Cycel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToResult()
        setNavigationCOntroller()
        bindinfToViewModel()
        pickerCurrencySymbols()
        configureFromPickerViewSubscriber()
        configureToPickerViewSubscriber()
        detailsHistorialScreenSubscribation()
        bindingFromVIewModel()
        viewModel.viewDidLoad()
    }

    
    fileprivate func setNavigationCOntroller(){
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func pickerCurrencySymbols(){
        fromCurrencySymbolsField.inputView = fromPickerView
        toCurrencySymbolsField.inputView = toPickerView
    }
    
    fileprivate func bindinfToViewModel(){
        currencyCountTextField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.input.amountBehavior)
            .disposed(by: bag)
        
        fromCurrencySymbolsField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.input.fromCurrencySymbolBehavior)
            .disposed(by: bag)
        
        toCurrencySymbolsField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.input.toCurrencySymbolBehavior)
            .disposed(by: bag)
        
        flipFromToBtn
            .rx
            .tap
            .bind(to: viewModel.input.swipCurrencyChange)
            .disposed(by: bag)
    }
    
    fileprivate func bindingFromVIewModel(){
        viewModel.combineFromToFields().subscribe(onNext: {[weak self] (fromTxt , toTxt) in
            guard let self = self else {return}
            self.fromCurrencySymbolsField.text = fromTxt
            self.toCurrencySymbolsField.text = toTxt
        }).disposed(by: bag)
    }
    
    fileprivate func subscribeToResult(){
        viewModel.output.resultCurrenyPublisher.asObservable()
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] curreny in
                guard let self = self else {return}
                self.resultLabel.text = String(curreny.result)
                
                print("Result is \(curreny)")
                HistoricalCurrencyLocally.instance.saveCurrencyRestult(curreny)
        }).disposed(by: bag)
    }
    
    fileprivate func configureFromPickerViewSubscriber(){
        viewModel.output
            .currencySymbolsBehavior.asObservable()
            .bind(to: fromPickerView.rx.itemTitles) { (row, element) in
            return element
        }.disposed(by: bag)

        fromPickerView.rx.modelSelected(String.self)
            .map({$0[0]}).subscribe(onNext: { [weak self] selected in
                guard let self = self else {return }
                self.viewModel.input.fromCurrencySymbolBehavior.accept(selected)
        }).disposed(by: bag)
    }
    
    fileprivate func configureToPickerViewSubscriber(){
        viewModel.output
            .currencySymbolsBehavior.asObservable()
            .bind(to: toPickerView.rx.itemTitles) { (row, element) in
            return element
        }.disposed(by: bag)

        toPickerView.rx.modelSelected(String.self)
            .map({$0[0]}).subscribe(onNext: { [weak self] selected in
                guard let self = self else {return}
                self.viewModel.input.toCurrencySymbolBehavior.accept(selected)
        }).disposed(by: bag)
    }
    
    fileprivate func detailsHistorialScreenSubscribation(){
        detailsBtn.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let self = self else  { return }
            let historivalVC: HistoricalViewController = Resolver.resolve()
            self.navigationController?.pushViewController(historivalVC, animated: true)
        }).disposed(by: bag)
    }
}

extension MoneyServiceViewController{
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

