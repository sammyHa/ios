//
//  Utilities.swift
//  UITabBar
//
//  Created by Samim Hakimi on 1/20/22.
//

import UIKit

extension UITextField {
    
    func paddingLeft(inset: CGFloat){
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.leftViewMode = UITextField.ViewMode.always
        
    }
    
    func paddingRight(inset: CGFloat){
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.rightViewMode = UITextField.ViewMode.always
        
    }
    
    func textFieldStyle(textField: UITextField){
        
        let textFieldColor = UIColor(displayP3Red: 0, green: 141, blue: 255, alpha: 100)
        textField.layer.borderColor = textFieldColor.cgColor
        textField.layer.borderWidth = 0.3
        textField.layer.cornerRadius = 22.0
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 15);
        
        
    }
    
    func addRightView(image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 10, width: 30, height: 30))
        imageView.image = image
        rightView = imageView
        rightViewMode = .always
        addSubview(imageView)
    }
    
    
  
    
    
}
extension UIButton {
    func buttonStyle(uiButton: UIButton) {
        let borderColor = UIColor(displayP3Red: 0, green: 141, blue: 255, alpha: 100)
        uiButton.layer.borderWidth = 0.3
        uiButton.layer.borderColor = borderColor.cgColor
        uiButton.layer.cornerRadius = 22.0
        uiButton.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 8)
        
    }

}



// Date picker
extension UITextField {

  func addInputViewDatePicker(target: Any, selector: Selector) {

   let screenWidth = UIScreen.main.bounds.width

   //Add DatePicker as inputView
   let datePicker = UIDatePicker(frame: CGRect(x: 0, y: -100, width: 100, height: 100))
   datePicker.datePickerMode = .date
   self.inputView = datePicker

   //Add Tool Bar as input AccessoryView
   let toolBar = UIToolbar(frame: CGRect(x: 0, y: -100, width: screenWidth, height: 44))
   let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
   let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
   let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
  toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)

   self.inputAccessoryView = toolBar
}

  @objc func cancelPressed() {
    self.resignFirstResponder()
  }
}


//Picker type BUY and SELL
extension AddViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeOfTrade.text = type[row]
        typeOfTrade.resignFirstResponder()
    }
    
}
