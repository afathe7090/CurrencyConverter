//
//  HistoricalCell.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import UIKit

class HistoricalCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var toLbl: UILabel!
    @IBOutlet weak var resultLBL: UILabel!
    @IBOutlet weak var fromLBl: UILabel!
    
    @IBOutlet weak var amountLBL: UILabel!
    @IBOutlet weak var backView: UIView! { didSet {backView.layer.cornerRadius = 10}}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellCurrency(currency: Currency){
        dateLbl.text = currency.date
        toLbl.text = currency.query?.to
        fromLBl.text = currency.query?.from
        resultLBL.text = String(currency.result)
        amountLBL.text = String(currency.query!.amount)
    }
    
}
