//
//  CollectionViewController.swift
//  TableViewExample
//
//  Created by Samim Hakimi on 1/24/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    let dataSource: [Stocks] = [
        Stocks(ticker: "MRNA", price: "189.0", quantity: "200"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "MRNA", price: "189.0", quantity: "200"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "MRNA", price: "189.0", quantity: "200"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "MRNA", price: "189.0", quantity: "200"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400"),
        Stocks(ticker: "MRNA", price: "189.0", quantity: "200"),
        Stocks(ticker: "BA", price: "209.0", quantity: "100"),
        Stocks(ticker: "NVAX", price: "130.0", quantity: "400")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell =  UICollectionViewCell()
        
        if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell {
            countryCell.configure(with: dataSource[indexPath.row])
            cell = countryCell
        }
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(dataSource[indexPath.item])")
    }

    
}
