//
//  GraphViewController.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/20/22.
//

import UIKit
import Charts
import TinyConstraints
import Pods_UITabBar
import FirebaseFirestore


class GraphViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var currentBalancetxt: UILabel!
    @IBOutlet weak var currentValue: UILabel!
    @IBOutlet weak var currentBalancePercentage: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateTotalPortfolioValue()
        calculateAverageCost()
        lineChartView.delegate = self
        
        // line chart view
        setData()
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData(){
     
        let set1 = LineChartDataSet(entries: yValue)
        
        set1.drawCirclesEnabled = false
        set1.mode = .horizontalBezier
        set1.lineWidth = 5
        set1.setColor(UIColor(red: 123/255, green: 150/255, blue: 255/255, alpha: 1))
        set1.fill = Fill(color: .systemBlue)
        set1.fillAlpha = 0.3
        set1.drawFilledEnabled = true
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .white
        set1.highlightLineWidth = 1
        //create line data and pass the set of the  data
        let data = LineChartData(dataSet: set1)
        lineChartView.data = data
        data.setDrawValues(false)
        
        lineChartView.rightAxis.enabled = false
        
        let yAxis = lineChartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.labelTextColor = .white
        yAxis.setLabelCount(6, force: false)
        yAxis.axisLineColor = .white
        yAxis.drawGridLinesEnabled = false
        
        
        let xAxis = lineChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.labelTextColor = .white
        xAxis.drawGridLinesEnabled = false
        
        lineChartView.animate(xAxisDuration: 1)
    }
    
    
    let yValue: [ChartDataEntry] = [
        
        ChartDataEntry(x: 0.0, y: 1000.0),
        ChartDataEntry(x: 1.0, y: 500.0),
        ChartDataEntry(x: 2.0, y: 700.0),
        ChartDataEntry(x: 3.0, y: 900.0),
        ChartDataEntry(x: 4.0, y: 1000.0),
        ChartDataEntry(x: 5.0, y: 1200.0),
        ChartDataEntry(x: 6.0, y: 1500.0)
//        ChartDataEntry(x: 7.0, y: 800.0),
//        ChartDataEntry(x: 8.0, y: 1200.0),
//        ChartDataEntry(x: 9.0, y: 1300.0),
//        ChartDataEntry(x: 10.0, y: 500.0),
//        ChartDataEntry(x: 11.0, y: 1700.0),
//        ChartDataEntry(x: 12.0, y: 800.0),
//        ChartDataEntry(x: 13.0, y: 200.0),
//        ChartDataEntry(x: 14.0, y: 500.0),
//        ChartDataEntry(x: 15.0, y: 700.0),
//        ChartDataEntry(x: 16.0, y: 500.0),
//        ChartDataEntry(x: 17.0, y: 900.0),
//        ChartDataEntry(x: 18.0, y: 800.0),
//        ChartDataEntry(x: 19.0, y: 700.0),
//        ChartDataEntry(x: 20.0, y: 500.0),
//        ChartDataEntry(x: 21.0, y: 200.0),
//        ChartDataEntry(x: 22.0, y: 400.0)
    ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    

    
    
    func setChart() {
     

    }
    
    
    private func calculateTotalPortfolioValue() {
        var sum = 0.0
        // total portfolio = (averagePrice * quantity)
        //var totalCost = 0.0
        for x in stocks {
            
            sum = sum + (x.averagePrice * Double(x.quantity))
        }
        
        let val = (floor(sum * 10)/10.0)
        print(val)
        currentValue.text = String("$\(val)")
        currentValue.textColor = .white
        currentBalancetxt.textColor = .gray
    }
    
    
    // Calculate the average cost of stock bought more then once
    
    func calculateAverageCost() {
        
        var totalQty = 0.0
        var totalCost = 0.0
        
        var currCost = 0.0
        var aveCost = 0.0
        var newQuantity = 0.0
        for stock in stocks {
            if stock.ticker.count > 1 && stock.ticker == "MRNA" && stock.type == "BUY" {
                
                totalQty += Double(stock.quantity)
                currCost = Double(Double(stock.quantity) * stock.averagePrice)
              
                totalCost += currCost
                aveCost = totalCost/totalQty
            }
            if stock.ticker.count > 1 && stock.ticker == "MRNA" && stock.type == "SEL" {
                newQuantity = totalQty - Double(stock.quantity)
            }
        }
        
        print("Old Total Quantity \(totalQty)")
        print("New Total Quantity \(newQuantity)")
        print("Average Cost \(aveCost)")
    }
}

extension GraphViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
            fatalError()
        }
        cell.setup(with: stocks[indexPath.row])
        cell.layer.cornerRadius = 18
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected  \(stocks[indexPath.row])")
    }
}

