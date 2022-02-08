//
//  Stocks.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/22/22.
//

import Foundation

struct Stocks {
    
    let ticker: String
    let averagePrice: Double
    let profit: Double
    let quantity: Int
    let type: String
    let tradeDate: String
    
}
// alpha ventage api key
let API_KEY = "YWRI38N5JZNV5LEI"
// total portfolio = (averagePrice * quantity)
// total p/l = (averagePrie - currentPrice) * quantity
// percentage Gain =  (currentPrice - averagePrice)/averagePrice => ([$52 - $50] / $50)


let stocks: [Stocks] = [
    
    Stocks(ticker: "MRNA", averagePrice: 125.0, profit:100.11, quantity: 100, type: "BUY", tradeDate: "1/29/2022"),
    Stocks(ticker: "MRNA", averagePrice: 12.50, profit:200.89, quantity: 240, type: "BUY", tradeDate: "1/31/2022"),
    Stocks(ticker: "MRNA", averagePrice: 29.10, profit: -400.77, quantity:155, type: "SELL", tradeDate: "2/1/2022"),
    Stocks(ticker: "MRNA", averagePrice: 10.20, profit:300.54, quantity:60, type: "BUY", tradeDate: "2/2/2022"),
    Stocks(ticker: "AAL", averagePrice: 15.55, profit: -700, quantity:300, type: "BUY", tradeDate: "2/3/2022"),
    Stocks(ticker: "APPL", averagePrice: 40.80, profit:500, quantity:100, type: "SELL", tradeDate: "2/4/2022"),
    Stocks(ticker: "BA", averagePrice: 60, profit:600 , quantity:30, type: "BUY", tradeDate: "2/5/2022")
//    Stocks(ticker: "BA", averagePrice: 205.10, profit:600 , quantity:30, type: "BUY", tradeDate: "2/6/2022")
//    Stocks(ticker: "BA", averagePrice: 205.10, profit:600 , quantity:30, type: "BUY", tradeDate: "2/7/2022")
    
]
