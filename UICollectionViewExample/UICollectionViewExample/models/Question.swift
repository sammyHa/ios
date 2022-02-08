//
//  Question.swift
//  UICollectionViewExample
//
//  Created by Samim Hakimi on 2/8/22.
//

import Foundation
import UIKit

struct Question {
    
    let questionId: UUID
    let user: User
    let questionDescription: String
    let comments: [Comment]
    let isAnswered: Bool
    let askTimestamp: Date
    let attachments: UIImage?
    
}

let questionUUID = UUID()
let userUUID = UUID()
let userCreated = Date.now
let commentCreated = Date.now

var questions: [Question] = [
    
    Question(questionId: questionUUID,
             user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated),
             questionDescription: "This is the question description",
             comments: [Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me.")],
             isAnswered: true, askTimestamp: commentCreated, attachments: UIImage(named: "code")),
    
    Question(questionId: questionUUID,
             user: User(userId: userUUID, name: "Samim", username: "@sammy_123", userCreationTimestamp: userCreated),
             questionDescription: "This is the question descriptio This is the question description This is the question description This is the question description This is the question description",
             
             comments: [
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me.")],
             
             isAnswered: true, askTimestamp: commentCreated, attachments: UIImage(named: "code")),
    
    Question(questionId: questionUUID,
             user: User(userId: userUUID, name: "Jess", username: "@sammy_123", userCreationTimestamp: userCreated),
             questionDescription: "This is the question descriptio This is the question description This is the question description This is the question description This is the question description",
             
             comments: [
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me.")],
             
             isAnswered: true, askTimestamp: commentCreated, attachments: UIImage(named: "code")),
    
    Question(questionId: questionUUID,
             user: User(userId: userUUID, name: "Alex", username: "@sammy_123", userCreationTimestamp: userCreated),
             questionDescription: "This is the question descriptio This is the question description This is the question description This is the question description This is the question description",
             
             comments: [
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me.")],
             
             isAnswered: true, askTimestamp: commentCreated, attachments: UIImage(named: "code")),
    
    Question(questionId: questionUUID,
             user: User(userId: userUUID, name: "Joe", username: "@sammy_123", userCreationTimestamp: userCreated),
             questionDescription: "This is the question descriptio This is the question description This is the question description This is the question description This is the question description",
             
             comments: [
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me."),
                Comment(commentId: 1, user: User(userId: userUUID, name: "Nolan", username: "@nolan_123", userCreationTimestamp: userCreated), comment: "YEs this has worked for me.")],
             
             isAnswered: true, askTimestamp: commentCreated, attachments: UIImage(named: "code"))
]
