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

enum WeekDayName: String {
    case Sunday = "Sun"
    case Monday = "Mon"
    case Tuesday = "Tue"
    case Wednesday = "Wed"
    case Thursday = "Thu"
    case Friday = "Fri"
    case Saturday = "Sat"

}

class GraphViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var currentBalancetxt: UILabel!
    @IBOutlet weak var currentValue: UILabel!
    @IBOutlet weak var currentBalancePercentage: UILabel!
    @IBOutlet weak var barChartView: BarChartView!
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
  
    
    var todayName:String!
    let week = ["Sun", "Mon", "Tue", "Wed","Thu", "Fri", "Sat"]
   //    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    var staticSteps = [Double]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView?.delegate = self
        calculateTotalPortfolioValue()
        setChart(dataPoints: week, values: createNewArray())
//        setup(barChartView: barChartView)
     
        calculateAverageCost()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //MARK: Get Current Day Name
      func getCurrentDayName()-> String {
      
          for i in stocks.suffix(7) {
              let strDate = i.tradeDate
              print("Date lasst seven \(strDate)")
             
              let dateFormatter = DateFormatter()
              dateFormatter.locale = Locale(identifier: "en_US_POSIX")
              dateFormatter.dateFormat = "MM/dd/yyyy"
              let date = dateFormatter.date(from: strDate)
              
              let weekday = Calendar.current.component(.weekday, from: date!)
              
          switch weekday {
              case 1:
                  todayName = WeekDayName.Sunday.rawValue
              case 2:
                  todayName = WeekDayName.Monday.rawValue
              case 3:
                  todayName = WeekDayName.Tuesday.rawValue
              case 4:
                  todayName = WeekDayName.Wednesday.rawValue
              case 5:
                  todayName = WeekDayName.Thursday.rawValue
              case 6:
                  todayName = WeekDayName.Friday.rawValue
              case 7:
                  todayName = WeekDayName.Saturday.rawValue
              default:
                  return "Nothing"
          }
        }
          return todayName
      }
    

    
    func createNewArray() -> [Double] {
        
        var stepsThisWeek = [Double]()
        
        for i in stocks {
            staticSteps.append(i.averagePrice)
        }

        // use todays day to find the index of where it appears in var week=[String]()
     
        if let todayIndex = week.firstIndex(of: getCurrentDayName()) {

            // create indices range of 0 to todayIndex
            let daysSoFarIndices = [Int](0...todayIndex)

            // create new array of var staticSteps=[Int]() at daysSoFarIndices
            stepsThisWeek = daysSoFarIndices.map { staticSteps[$0]}

            //create indices from todayIndex +1 to lastIndex of var staticSteps=[Int]()
            let daysLaterInWeek = [Int](todayIndex..<staticSteps.endIndex)
            //add 0 values for each daysLaterInWeek remaining
            for _ in daysLaterInWeek {
                stepsThisWeek.append(0)
            }
        }
        return stepsThisWeek
    }

    
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."

        var dataEntries: [BarChartDataEntry] = []
     

        for i in 0..<stocks.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")
        chartDataSet.colors = ChartColorTemplates.material()
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.legend.enabled = false
        barChartView.data = chartData
        
        barChartView.setScaleEnabled(false)
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.labelTextColor = .white
        barChartView.chartDescription?.enabled = false
        barChartView.drawValueAboveBarEnabled = false
        
        //hides grid
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        barChartView.xAxis.valueFormatter = WeekValueFormatter()
        
        let xAxis = barChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.labelTextColor = .white
        barChartView.leftAxis.labelTextColor = .white
        barChartView.leftAxis.spaceTop = 0.15
        
        barChartView.animate(yAxisDuration: 3)
        barChartView.drawGridBackgroundEnabled = false

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


//MARK: Weeks Bottom Label Class for x-Axis labels
public class WeekValueFormatter: NSObject, IAxisValueFormatter {

    override init() {
        super.init()
    }

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
       
        let week = ["Sun", "Mon", "Tue", "Wed","Thu", "Fri", "Sat"]
        
        for i in stocks.suffix(7) {

            let strDate = i.tradeDate
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date = dateFormatter.date(from: strDate)
            _ = Calendar.current.component(.weekday, from: date!)
      

        }
        //var val = week[Int(value)].suffix(7)
        return week[Int(value)]
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

