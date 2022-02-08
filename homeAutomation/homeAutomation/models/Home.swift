//
//  Home.swift
//  homeAutomation
//
//  Created by Samim Hakimi on 2/6/22.
//

import Foundation

struct Home {
    let owner: User
    let address: String?
    let kwhUsage: Double
    let rooms: [Room]
}
