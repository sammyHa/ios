//
//  Comment.swift
//  UICollectionViewExample
//
//  Created by Samim Hakimi on 2/8/22.
//

import Foundation
import UIKit

struct Comment {
    let comentId: Int?
    let user: User
    let comment: String
    
    init(commentId: Int?, user: User, comment: String) {
        self.comentId = commentId
        self.user = user
        self.comment = comment
    }
}
