//
//  CustomIcons.swift
//  UICollectionViewExample
//
//  Created by Samim Hakimi on 2/9/22.
//

import Foundation
import UIKit
class CustomUI: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(icon: String) {
        super.init(frame: .zero)
        image = UIImage(named: icon)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // assigned the data in the setup method of the custome cell
    init(fontSize: UIFont?, textColor: UIColor?) {
        super.init(frame: .zero)
        numberOfLines = 0
        font = fontSize
        textAlignment = .left
        self.textColor = textColor
        adjustsFontSizeToFitWidth = false
        minimumScaleFactor = 0.5
        translatesAutoresizingMaskIntoConstraints = false
 
    }
}
