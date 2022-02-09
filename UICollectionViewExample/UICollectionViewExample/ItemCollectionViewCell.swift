//
//  ItemCollectionViewCell.swift
//  UICollectionViewExample
//
//  Created by Samim Hakimi on 2/7/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "code")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let attachment: UIImageView = {
        let attach = UIImageView()
        attach.image = UIImage(named: "code")
        attach.contentMode = .scaleAspectFill
        attach.clipsToBounds = true
        attach.layer.cornerRadius = 16
        attach.translatesAutoresizingMaskIntoConstraints = false
        
        return attach
    }()
    
    private let nameLabel: UILabel = {
        let userName = UILabel()
        
//        userName.text = "Nolan"
//        userName.font = UIFont.boldSystemFont(ofSize: 18)
        
        var attributedText: NSMutableAttributedString?
        
        for q in questions {
            
            attributedText = NSMutableAttributedString(string: "\(q.user.name)",
                                 attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
//            attributedText?.append(NSMutableAttributedString(string: " \(String(describing: user.username)) ",
//                                                            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
//
//            attributedText?.append(NSMutableAttributedString(string: " \(String(describing: user.time))",
//                                  attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
            
        }
        userName.attributedText = attributedText
        
        userName.textAlignment = .left
        userName.textColor = .black
        
        userName.adjustsFontSizeToFitWidth = false
        userName.minimumScaleFactor = 0.5
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        return userName
    }()
    
    
    
    
    private let questionTextview: UITextView = {
        
        var attributedTextview: NSMutableAttributedString?
        let textview = UITextView()
        
        for q in questions {
            attributedTextview = NSMutableAttributedString(string: "\(q.questionDescription)",
                                                           attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black
                                                                       ])
    
        }
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.attributedText = attributedTextview
        textview.isEditable = false
        textview.isSelectable = false
        textview.isScrollEnabled = false
        textview.backgroundColor = .none
        
        return textview
    }()
    
    
    private let commentIcon: UIImageView = {
       let comment = UIImageView()
        comment.image = UIImage(named: "comment")
        comment.contentMode = .scaleAspectFill
        comment.clipsToBounds = true
        comment.translatesAutoresizingMaskIntoConstraints = false
        
        return comment
    }()
    
    private let commentCount: UILabel = {
        let commentLbl = UILabel()
        commentLbl.translatesAutoresizingMaskIntoConstraints = false
        
        var attributeText: NSMutableAttributedString?
        for q in questions {
            
            attributeText = NSMutableAttributedString(string: "\(String(describing: q.comments))", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
            
        }
     
       
        commentLbl.attributedText = attributeText
        return commentLbl
        
    }()
    
    private let likeIcon: UIImageView = {
       let like = UIImageView()
        like.image = UIImage(named: "heart")
        like.contentMode = .scaleAspectFill
        like.clipsToBounds = true
        like.translatesAutoresizingMaskIntoConstraints = false

        return like
    }()


    private let shareIcon: UIImageView = {
       let share = UIImageView()
        share.image = UIImage(named: "share")
        share.contentMode = .scaleAspectFill
        share.clipsToBounds = true
        share.translatesAutoresizingMaskIntoConstraints = false

        return share
    }()

    private let aprovedIcon: UIImageView = {
       let aproved = UIImageView()
        aproved.image = UIImage(named: "checked")
        aproved.contentMode = .scaleAspectFill
        aproved.clipsToBounds = true
        aproved.translatesAutoresizingMaskIntoConstraints = false

        return aproved
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 25
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(questionTextview)
        contentView.addSubview(attachment)
        contentView.addSubview(commentIcon)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(commentTouched(gestureRecognizers:)))
        commentIcon.addGestureRecognizer(gesture)
        commentIcon.isUserInteractionEnabled = true
        contentView.addSubview(commentCount)
        contentView.addSubview(likeIcon)
        contentView.addSubview(shareIcon)
        contentView.addSubview(aprovedIcon)
        contentView.clipsToBounds = true
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setuLayout()
    }
    
    
   private func setuLayout() {

       
       profileImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 22).isActive = true
       profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
       //profileImage.widthAnchor.constraint(equalToConstant: 60).isActive = true // not needed idk know why lol
       profileImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
       
       profileImage.layer.borderWidth = 1
       profileImage.layer.borderColor = UIColor.lightGray.cgColor
       profileImage.layer.cornerRadius = profileImage.frame.size.width/2
       
       nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
       nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
       nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22).isActive = true
       
       
       questionTextview.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -5).isActive = true
       questionTextview.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
       questionTextview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
       
       
       attachment.topAnchor.constraint(equalTo: questionTextview.bottomAnchor, constant: 10).isActive = true
       attachment.leadingAnchor.constraint(equalTo: questionTextview.leadingAnchor).isActive = true
       attachment.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
       attachment.widthAnchor.constraint(equalToConstant: 300).isActive = true
       attachment.heightAnchor.constraint(equalToConstant: 200).isActive = true
       
     
       commentIcon.topAnchor.constraint(equalTo: attachment.bottomAnchor, constant: 50).isActive = true
       commentIcon.leadingAnchor.constraint(equalTo: attachment.leadingAnchor).isActive = true
       
       commentCount.topAnchor.constraint(equalTo: commentIcon.topAnchor).isActive = true
       commentCount.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 8).isActive = true
       
       likeIcon.topAnchor.constraint(equalTo: commentCount.topAnchor).isActive = true
       likeIcon.leadingAnchor.constraint(equalTo: commentCount.trailingAnchor, constant: 40).isActive = true
       likeIcon.backgroundColor = .none

       shareIcon.topAnchor.constraint(equalTo: likeIcon.topAnchor).isActive = true
       shareIcon.leadingAnchor.constraint(equalTo: likeIcon.trailingAnchor, constant: 40).isActive = true
       shareIcon.backgroundColor = .none

       aprovedIcon.topAnchor.constraint(equalTo: shareIcon.topAnchor).isActive = true
       aprovedIcon.leadingAnchor.constraint(equalTo: shareIcon.trailingAnchor, constant: 40).isActive = true
       
    }
    
    @objc func commentTouched(gestureRecognizers: UIGestureRecognizer){
        
        if ((gestureRecognizers.view as? UIImageView) != nil) {
            
            
            
        }
    }
    
    //setup the data
    func setup(with q: Question){
        nameLabel.text = q.user.name
        questionTextview.text = q.questionDescription
        attachment.image = q.attachments
        commentCount.text = String(q.comments.count)
        
        if q.isAnswered == true {
            aprovedIcon.image = UIImage(named: "checkgreen")
        }else {
            aprovedIcon.image = UIImage(named: "checked")
        }
        
    }
}
