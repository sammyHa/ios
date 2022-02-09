//
//  CustomButton.swift
//  UIreusableButton
//
//  Created by Samim Hakimi on 2/8/22.
//

import Foundation
import UIKit


class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    init(title: String){
        super.init(frame: .zero)
        backgroundColor = .purple
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        layer.cornerRadius = 22
        layer.masksToBounds = true
    }
    
    
    
}
