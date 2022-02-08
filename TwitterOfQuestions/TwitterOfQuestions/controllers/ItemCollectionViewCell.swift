//
//  ItemCollectionCellCollectionViewCell.swift
//  TwitterOfQuestions
//
//  Created by Samim Hakimi on 2/6/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userProfile: UIImage!
    @IBOutlet weak var nameOfUser: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var attach: UIImage!
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes
    {
        let attr: UICollectionViewLayoutAttributes = layoutAttributes.copy() as! UICollectionViewLayoutAttributes

        var newFrame = attr.frame
        self.frame = newFrame

        self.setNeedsLayout()
        self.layoutIfNeeded()

        let desiredHeight: CGFloat = self.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        newFrame.size.height = desiredHeight
        attr.frame = newFrame
        return attr
    }

    
    func setupPost(with q: Question){
        attach = q.attachedImage
        //userProfile.cgImage = UIImage(systemName: "person")
        nameOfUser.text = q.user.name
        userName.text = q.user.userName
        textview.text = q.question
        //dateTime.text = String(question.PostedDateTime)
        
        
    }
}
