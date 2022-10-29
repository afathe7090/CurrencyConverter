//
//  RatedCollectionCell.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import UIKit

class RatedCollectionCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView! { didSet { backView.layer.cornerRadius = 10}}
    @IBOutlet weak var currencySymbolLabel: UILabel!
    @IBOutlet weak var ratedValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    func setUpCell(rated: Dictionary<String, Double>.Element){
        currencySymbolLabel.text = rated.key
        ratedValueLabel.text = String(rated.value)
    }

}
