//
//  ItemCollectionViewCell.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/22/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPandLLabel: UILabel!
    
    
    func setup(with stock: Stocks) {
        
        tickerLabel.text = stock.ticker
        priceLabel.text = stock.price
//        totalLabel.text = stock.profitText
        totalPandLLabel.text = stock.profit
        
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(contentView)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
    
    
}
