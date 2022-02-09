//
//  Comment.swift
//  UICollectionViewExample
//
//  Created by Samim Hakimi on 2/8/22.
//

import Foundation
import UIKit

struct Comment {
    let comentId: String
    let user: User
    let comment: String
    
    init(commentId: String, user: User, comment: String) {
        self.comentId = commentId
        self.user = user
        self.comment = comment
    }
}
