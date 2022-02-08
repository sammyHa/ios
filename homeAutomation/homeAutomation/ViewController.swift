//
//  ViewController.swift
//  homeAutomation
//
//  Created by Samim Hakimi on 2/6/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myHome = Home(
            owner: User(name: "Nolan"), address: nil, kwhUsage: 34.8,
            
             rooms: [
                    Room(name: "Living room", devices: ["lights", "AC","TV", "Speakers"]),
                    Room(name: "Dining room", devices: ["lights", "AC"]),
                    Room(name: "Bathroom", devices: ["lights"]),
                    Room(name: "Bed room", devices: ["lights", "AC","TV"])
                 ])
        print("welcome home")
        print("\(myHome.owner.name)")
        print("You have used \(myHome.kwhUsage) kWH this month")
        
        for i in myHome.rooms {
            let countDevices = i.devices.count
            print("\(i.name) has \(countDevices) Device")
            for j in i.devices {
                print("\(j)") // get the devices names
              
            }
            print("") // just to create a line after the loop ends
            
        }
    }
}

