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
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 8);
        
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

