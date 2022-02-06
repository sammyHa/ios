//
//  Graph.swift
//  UITabBar
//
//  Created by Samim Hakimi on 2/5/22.
//

import Foundation
import SwiftUI

struct LineGraph: Shape {
    var dataPoints: [CGFloat]
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint.zero)
            p.addLine(to: CGPoint(x: 100, y: 100))
        }
    }
    
    
}
