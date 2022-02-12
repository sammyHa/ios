//
//  ViewController.swift
//  RingAnimation
//
//  Created by Samim Hakimi on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Goal for all"
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    var displayLink: CADisplayLink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.sizeToFit()
        label.center = view.center
        
        
        displayLink = CADisplayLink(target: self, selector: #selector(handleAimation))
        displayLink.add(to: .main, forMode: .default)
        displayLink.isPaused = true
        
        
        let circleShape = UIBezierPath(arcCenter: view.center,
                                       radius: 180,
                                       startAngle: -(.pi / 2),
                                       endAngle: .pi * 2,
                                       clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.lineCap = CAShapeLayerLineCap.round
        trackShape.path = circleShape.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circleShape.cgPath
        
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        shape.lineCap = CAShapeLayerLineCap.round
        shape.miterLimit = 15.0
        view.layer.addSublayer(shape)
        
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height-70, width: view.frame.size.width-40, height: 50))
        view.addSubview(button)
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

    }
    var startValue: Double = 990
    let endValue: Double = 1000
    let animationDuration: Double = 3.5
    let animatioinStateDate = Date()

    @objc func didTapButton(){
       
        ///Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3.5
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        
        if displayLink.isPaused {
            displayLink = CADisplayLink(target: self, selector: #selector(handleAimation))
            displayLink.add(to: .main, forMode: .default)
            displayLink.isPaused = false
            
        }
        
        
        
    }
    
   
    @objc func handleAimation(_ displayLink: CADisplayLink){
        let now = Date()
        let elapseTime = now.timeIntervalSince(animatioinStateDate)
        
        if elapseTime > animationDuration {
            label.text = "\(endValue) Calories"
            
        } else {
            let percentage = elapseTime / animationDuration
            let value = startValue + percentage * (endValue - startValue)
            label.text = "\(value)"
        }
        
    
        
    }
}

