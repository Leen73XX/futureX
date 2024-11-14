//
//  LineChart.swift
//  future contract
//
//  Created by Leen Almejarri on 11/05/1446 AH.
//

import Foundation
import SwiftUI

struct LineData {
    var values: [Double]  // The data points for the line
    var color: Color      // The color for this line
}

// Custom Shape for drawing lines
struct LineChartShape: Shape {
    var data: [Double]
    var scaleY: CGFloat
    var scaleX: CGFloat
    var startX: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start drawing at the first point
        guard let firstValue = data.first else { return path }
        let startPoint = CGPoint(x: startX, y: rect.height - CGFloat(firstValue) * scaleY)
        path.move(to: startPoint)

        // Add the rest of the points
        for i in 1..<data.count {
            let point = CGPoint(x: startX + CGFloat(i) * scaleX , y: rect.height - CGFloat(data[i]) * scaleY)
            path.addLine(to: point)
        }

        return path
    }
}
