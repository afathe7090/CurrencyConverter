//
//  RatedCurrecnctViewController.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import UIKit
import Resolver
import RxSwift
import RxCocoa

class RatedCurrecnctViewController: UIViewController {

    private let bag = DisposeBag()
    @Injected private var viewModel: RatedCurrencyViewModelProtocol
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionViewCell()
        collectionViewSubscribation()
        viewModel.viewDidLoad()
    }
    
    fileprivate func configureCollectionViewCell(){
        collectionView.setCollectionViewLayout(layOut(), animated: true)
        collectionView.register(UINib(nibName: String(describing: RatedCollectionCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: RatedCollectionCell.self))
    }

    fileprivate func collectionViewSubscribation(){
        viewModel.output.ratedCurency.bind(to: collectionView.rx.items(cellIdentifier: String(describing: RatedCollectionCell.self), cellType: RatedCollectionCell.self)){ (_ , rated , cell) in
            cell.setUpCell(rated: rated)
        }.disposed(by: bag)
    }
    
}
