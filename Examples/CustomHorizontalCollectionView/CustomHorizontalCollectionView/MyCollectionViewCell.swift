//
//  MyCollectionViewCell.swift
//  CustomHorizontalCollectionView
//
//  Created by Samim Hakimi on 1/25/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
     
    static var identifier = "MyCollectionViewCell"
    
    @IBOutlet weak var ticker: UILabel!
    @IBOutlet weak var price: UILabel!
    
    //Fuction to setup the data for the collection view
    func configure(with stock: Stock) {
        ticker.text = stock.ticker
        price.text = stock.price
    }
    
    
}


// model
struct Stock {
    var ticker: String
    var price: String
    
}

// dummy data for the model to display on the collection view
var stocks: [Stock] = [
    Stock(ticker: "MRNA", price: "140.55"),
    Stock(ticker: "BA", price: "208.44"),
    Stock(ticker: "APPL", price: "155.44"),
    Stock(ticker: "MRNA", price: "140.55"),
    Stock(ticker: "BA", price: "208.44"),
    Stock(ticker: "MRNA", price: "140.55"),
    Stock(ticker: "BA", price: "208.44"),
    Stock(ticker: "MRNA", price: "140.55"),
    Stock(ticker: "BA", price: "208.44")
]
