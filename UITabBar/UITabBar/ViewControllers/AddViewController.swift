//
//  AddViewController.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/19/22.
//

import UIKit
import FirebaseFirestore

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ticker: UITextField!
    @IBOutlet weak var tradeDate: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var averagePrice: UITextField!
    @IBOutlet weak var typeOfTrade: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var total: UILabel!

    let datePicker = UIDatePicker()
    let typePicker = UIPickerView()
    let type = ["","BUY", "SELL"]
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTextFields()
        //addIconToTextField(uiTextField: tradeDate)
        addIconToTextField(uiTextField: tradeDate)
        ticker.delegate = self
        tradeDate.delegate = self
        quantity.delegate = self
        averagePrice.delegate = self
        typePicker.delegate = self
        typePicker.dataSource = self
        typeOfTrade.inputView = typePicker
        showDatePicker()

    }
    
    //add icon to the right of the textfield
    func addIconToTextField(uiTextField: UITextField) {
        
         let imageView = UIImageView(frame: CGRect(x: -18.0, y: 8.0, width: 24.0, height: 24.0))
        let image = UIImage(systemName: "calendar")
         imageView.image = image
         imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.lightGray
         //imageView.backgroundColor = UIColor.red
        
         let view = UIView(frame: CGRect(x: 18, y: 0, width: 25, height: 40))
         view.addSubview(imageView)
        //  view.backgroundColor = .green
        uiTextField.rightViewMode = UITextField.ViewMode.always
        uiTextField.rightView = view
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
 
    func setupTextFields() {
        
        ticker.textFieldStyle(textField: ticker)
        tradeDate.textFieldStyle(textField: tradeDate)
        quantity.textFieldStyle(textField: quantity)
        averagePrice.textFieldStyle(textField: averagePrice)
        typeOfTrade.textFieldStyle(textField: typeOfTrade)
        
        //padding
        ticker.paddingLeft(inset: 10)
        tradeDate.paddingLeft(inset: 10)
        quantity.paddingLeft(inset: 10)
        averagePrice.paddingLeft(inset: 10)
        typeOfTrade.paddingLeft(inset: 10)
        tradeDate.paddingLeft(inset: 10)
        
        
        //change the placeholder textColor
        ticker.attributedPlaceholder = NSAttributedString(string: "Ticker",
               attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])

        saveButton.buttonStyle(uiButton: saveButton!)
    }
   
  
    @IBAction func textFieldDidChangeSelection(_ textField: UITextField) {
        averagePrice.addTarget(self, action: #selector(textChange), for: .editingChanged)
        quantity.addTarget(self, action: #selector(textChange), for: .editingChanged)
    }
    
    @objc func textChange(){
        let price = Double(averagePrice.text!)
        let qty = Double(quantity.text!)
        total.text = ("$\(String(describing: (price ?? 0.0) * (qty ?? 0.0)))")
    }
    
    
    
    
    // Button Action
    @IBAction func saveData() {
        
        if !ticker.text!.isEmpty && !quantity!.text!.isEmpty {
            saveToDb()
        }else{
            print("Data is empty")
            return
        }
        
        var averageCost = 0
        
        for i in stocks {
            if i.ticker.count > 1 && typeOfTrade.text == "BUY" {
                
                let qty = Int(quantity.text!)
                let averageP = Int(averagePrice.text!)
                let pre_shares_fromDB = 100
                let currentCost = 10.2
                let total = (pre_shares_fromDB) + (qty ?? 0)
                averageCost = Int(currentCost) + (averageP ?? 0) / total
                
            }else {
                let price = Double(averagePrice.text!)
                let qty = Double(quantity.text!)
                total.text = ("$\(String(describing: (price ?? 0.0) * (qty ?? 0.0)))")
            }
        }
        print("Total after average \(averageCost)")
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, yyyy"
        tradeDate.text = formatter.string(from: datePicker.date)
        print("Date is -> \(tradeDate.text ?? "")")
        
        
        ticker.text = ""
        tradeDate.text = ""
        quantity.text = ""
        averagePrice.text = ""
        typeOfTrade.text = ""
        total.text = "$0.0"
        
    }

    func today() {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, yyyy"
        tradeDate.text = formatter.string(from: date)
    
    }
  
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

      tradeDate.inputAccessoryView = toolbar
      tradeDate.inputView = datePicker
        datePicker.frame = CGRect(x: 0, y: 0, width: 0, height: 200)

     }

      @objc func donedatePicker(){

       let formatter = DateFormatter()
       formatter.dateFormat = "MMM, dd, yyyy"
       tradeDate.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
    
    
    
    // setup database
    func saveToDb() {
        
        let ticker = ticker.text!
        let quantity = Int(quantity.text!)
        let avePrice = Double(averagePrice.text!)
        let type = typeOfTrade.text!
        let date = tradeDate.text!
        
       
        
        ref = db.collection("stock").addDocument(data:
                  ["ticker": ticker ,
                   "avePrice": avePrice ?? 0.0,
                   "tadeDate": date ,
                  "quantity": quantity ?? 0,
                   "type": type
                 
                 ],
        
        completion: { err in
            if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(self.ref!.documentID)")
                }
        })

    }
    
}
