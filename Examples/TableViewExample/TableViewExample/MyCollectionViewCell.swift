//
//  MyCollectionViewCell.swift
//  TableViewExample
//
//  Created by Samim Hakimi on 1/24/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var tickerLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    
    
    
    func setup (with stock: Stocks) {
        tickerLbl.text = stock.ticker
        priceLbl.text = stock.price
        quantityLbl.text = stock.quantity
    }
    
}
