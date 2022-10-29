//
//  HistoricalViewController.swift
//  CurrencyConverter
//
//  Created by Ahmed Fathy on 28/10/2022.
//

import UIKit
import RxCocoa
import RxSwift
import Resolver

class HistoricalViewController: UIViewController {
    
    @Injected  private var viewModel: HistoricalViewModelProtocol
    private let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNibFileTableView()
        tableViewSubscribation()
        viewModel.viewDidLoad()
    }
    
    
    fileprivate func configureNibFileTableView(){
        tableView.register(UINib(nibName: String(describing: HistoricalCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: HistoricalCell.self))
    }
    
    fileprivate func tableViewSubscribation(){
        viewModel.output.historicalPublisher.asObserver().bind(to: tableView.rx.items(cellIdentifier: String(describing: HistoricalCell.self), cellType: HistoricalCell.self)) { (_ , element , cell ) in
            cell.setCellCurrency(currency: element)
        }.disposed(by: bag)
    }
    
    
}
