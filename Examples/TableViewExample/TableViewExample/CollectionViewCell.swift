//
//  CollectionViewCell.swift
//  TableViewExample
//
//  Created by Samim Hakimi on 1/24/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ticker: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    static var identifier = "CollectionViewCell"
    
    
    func configure( with stockName: Stocks){
        ticker.text = stockName.ticker
        price.text = stockName.price
        quantity.text = stockName.quantity
        
    }
}
