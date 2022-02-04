//
//  ItemCollectionViewCell.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/22/22.
//

import UIKit
import FirebaseFirestore

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPandLLabel: UILabel!
   
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    
    func setup(with stock: Stocks) {
        tickerLabel.text = stock.ticker
        tickerLabel.textColor = .lightGray
        priceLabel.text = String("$\(stock.averagePrice)")
        priceLabel.textColor = .lightGray
//        totalLabel.text = stock.profitText
        totalPandLLabel.text = String("$\(stock.profit)")
        if stock.profit.isLess(than: 0.0) {
            totalPandLLabel.textColor = UIColor.red
        }
        
    }
    
  
}
