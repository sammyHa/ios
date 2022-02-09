//
//  ViewController.swift
//  UIreusableButton
//
//  Created by Samim Hakimi on 2/8/22.
//

import UIKit

class ViewController: UIViewController {

    private let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Click Me", for: .normal)
        btn.backgroundColor = .systemRed
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.contentMode = .center
        btn.translatesAutoresizingMaskIntoConstraints = false
        
       
        return btn
        
    }()
    
    let customeButton: CustomButton = {
        let button1 = CustomButton(title: "Custom button")
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(buttonTabbed), for: .touchUpInside)
       return button1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        view.addSubview(customeButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupConstraint()
    }
    
    
    @objc func buttonTabbed(_ sender: UIButton?){
        print("Hello")
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }


    func setupConstraint(){
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTabbed), for: .touchUpInside)
        
        customeButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16).isActive = true
        customeButton.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        customeButton.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        customeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
}

