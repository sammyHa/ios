//
//  Stocks.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/22/22.
//

import Foundation

struct Stocks {
    let ticker: String
    let price: String
    let profit: String
    let profitText: String
}


let stocks: [Stocks] = [
    
    Stocks(ticker: "MRNA", price: "190.90", profit: "+400", profitText: "Total P/L"),
    Stocks(ticker: "APPL", price: "120.90", profit: "-100", profitText: "Total P/L"),
    Stocks(ticker: "BA", price: "200.90", profit: "+300", profitText: "Total P/L"),
    Stocks(ticker: "NVAX", price: "130.90", profit: "-100", profitText: "Total P/L"),
    Stocks(ticker: "MRNA", price: "190.90", profit: "+400", profitText: "Total P/L"),
    Stocks(ticker: "APPL", price: "120.90", profit: "-100", profitText: "Total P/L"),
    Stocks(ticker: "BA", price: "200.90", profit: "+300", profitText: "Total P/L"),
    Stocks(ticker: "NVAX", price: "130.90", profit: "-100", profitText: "Total P/L")
]
