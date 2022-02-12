//
//  Question.swift
//  UICollectionViewExample
//
//  Created by Samim Hakimi on 2/8/22.
//

import Foundation
import UIKit

class Question {
    
    let questionId: String
    let question: String
    

    init(questionId: String, question: String) {
        self.questionId = questionId
        self.question = question
    }
    
}

let questionUUID = UUID().uuidString
let userUUID = UUID().uuidString
let commentUUID = UUID().uuidString
let userCreated = Date.now
let commentCreated = Date.now

var userArray: [User] = {
    var sammy = User(userId: userUUID,
                     name: "Samim",
                     username: "@samim123",
                     userCreationTimestamp: userCreated,
                     question: "This is the question user asked from the community and should be answered within few seconds if not sooner")
   
    return [sammy]
    
}()

let questionArray: [Question] = {
    var q1 = Question(questionId: questionUUID, question: "This isthe adlskfj;asdlkf j;alkdfj;alkdjf;alkdfj;alkjdf;alkjdf;adk")
    
    return [q1]
}()
