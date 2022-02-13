//
//  CustomUI.swift
//  TwitterClone
//
//  Created by Samim Hakimi on 2/11/22.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(title: String){
        super.init(frame: .zero)
        text = title
        textColor = .systemBlue
        font = .boldSystemFont(ofSize: 18)
        translatesAutoresizingMaskIntoConstraints = false

    }
}


class CustomTextFields: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        placeholder = placeholderText
        textColor = UIColor.black
        layer.borderWidth = 0.5
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        layer.borderColor = UIColor.black.cgColor
        translatesAutoresizingMaskIntoConstraints = false

        
    }
    
}

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        layer.cornerRadius = 8
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
}
