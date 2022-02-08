//
//  Rooms.swift
//  homeAutomation
//
//  Created by Samim Hakimi on 2/6/22.
//

import Foundation

struct Room {
    
    let name: String // living room, bathroom, dining room etc...
    let devices: [String] // ac, lights, tv etc...

    init(name: String, devices: [String]) {
        self.name = name
        self.devices = devices
    }
}
