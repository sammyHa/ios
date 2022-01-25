//
//  AddViewController.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/19/22.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ticker: UITextField!
    @IBOutlet weak var tradeDate: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var averagePrice: UITextField!
    @IBOutlet weak var typeOfTrade: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
        setupTextFields()
        addIconToTextField(uiTextField: tradeDate)
    
        ticker.delegate = self
        tradeDate.delegate = self
        quantity.delegate = self
        averagePrice.delegate = self
        typeOfTrade.delegate = self
        
        
        
        
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
               attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])

        saveButton.buttonStyle(uiButton: saveButton!)
    }
    
    //add icon to the right of the textfield
    
    func addIconToTextField(uiTextField: UITextField) {
        
         let imageView = UIImageView(frame: CGRect(x: -18.0, y: 8.0, width: 24.0, height: 24.0))
         let image = UIImage(systemName: "calendar")
         imageView.image = image
         imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.darkGray
         //imageView.backgroundColor = UIColor.red
        
         let view = UIView(frame: CGRect(x: 18, y: 0, width: 25, height: 40))
         view.addSubview(imageView)
        //  view.backgroundColor = .green
        uiTextField.rightViewMode = UITextField.ViewMode.always
        uiTextField.rightView = view
    }
    
  
    
    // Button Action
    @IBAction func pressed() {
        ticker.text = ""
        tradeDate.text = ""
        quantity.text = ""
        averagePrice.text = ""
        typeOfTrade.text = ""
        print("Pressed")
    }
    
}


