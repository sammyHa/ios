//
//  ViewController.swift
//  TwitterClone
//
//  Created by Samim Hakimi on 2/11/22.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    private let loginButton = CustomButton(title: "Login")
    private let email = CustomTextFields(placeholderText: "Email")
    private let password = CustomTextFields(placeholderText: "password")
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome"
        lbl.textColor = .systemBlue
        lbl.font = .boldSystemFont(ofSize: 18)
        return lbl
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        view.addSubview(email)
        view.addSubview(password)
        view.backgroundColor = .purple
        loginButton.addTarget(self, action: #selector(didTabLogin), for: .touchUpInside)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            loginButton.setTitle("LOGOUT", for: .normal)
            loginButton.addTarget(self, action: #selector(logoutUser), for: .touchUpInside)
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        email.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        email.bottomAnchor.constraint(equalTo: password.topAnchor, constant: -8).isActive = true
        email.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: -8).isActive = true
        password.heightAnchor.constraint(equalToConstant: 40).isActive = true
        password.isSecureTextEntry = true
        
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        email.becomeFirstResponder()
//    }
    
    @objc func didTabLogin(){
        guard let email = email.text, !email.isEmpty,
              let password = password.text, !password.isEmpty else {
                  print("mising field data")
                  return
              }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else {
                // show account creations
                strongSelf.showCreationAccount(email: email, password: password)
                return
            }
            strongSelf.email.isHidden = true
            strongSelf.password.isHidden = true
            strongSelf.loginButton.isHidden = true
        }
       
       
    }
    
    @objc func logoutUser(){
       
            do {
                try FirebaseAuth.Auth.auth().signOut()
            }catch {
                print("Error at loging out")
            }
        
    }
    func showCreationAccount(email: String, password: String){
        let alert = UIAlertController(title: "Create Account",
                                      message: "Woudl you like to create an account?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                guard let strongSelf = self else {

                    return
                }
                guard error == nil else {
                    print("Account creation faild")

                    return
                }
                strongSelf.email.isHidden = true
                strongSelf.password.isHidden = true
                strongSelf.loginButton.isHidden = true
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            
        }))
        
        present(alert, animated: true)
    }

}
