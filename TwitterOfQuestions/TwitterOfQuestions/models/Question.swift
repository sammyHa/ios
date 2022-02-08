//
//  Question.swift
//  TwitterOfQuestions
//
//  Created by Samim Hakimi on 2/6/22.
//

import Foundation
import UIKit

struct Question {
    
    let id: Int
    let question: String
    let answer: String
    let comment: String
    let like: Int
    let isAproved: Bool
    let PostedDateTime: Date
    let attachedImage: UIImage?
    let user: User
}
