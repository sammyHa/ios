//
//  HomeViewController.swift
//  TwitterOfQuestions
//
//  Created by Samim Hakimi on 2/6/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "cell", for: indexPath) as? ItemCollectionViewCell else {
            fatalError()
        }
        cell.setupPost(with: questions[indexPath.row])
        cell.layer.cornerRadius = 25
        
        return cell
        
    }
    

    
}


let questions : [Question] = [
    Question(id: 1,
             question: "How to create a line chart in swift storyboard Using the charts library and coacopod?Thanks in advance!",
             
             answer: "No Answer", comment: "None", like: 14, isAproved: true, PostedDateTime: Date(),attachedImage:UIImage(named: "code"), user: User(userId: nil, name: "Nolan", userName: "@nolan", profilePic: nil)),
    
    Question(id: 1, question: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
             
             answer: "No Answer", comment: "None", like: 14, isAproved: true, PostedDateTime: Date(),attachedImage: UIImage(named: ""), user: User(userId: nil, name: "Nolan", userName: "@nolan", profilePic: nil)),
    
]
