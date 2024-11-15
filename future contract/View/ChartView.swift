//
//  LineChartView.swift
//  future contract
//
//  Created by Leen Almejarri on 11/05/1446 AH.
//

import SwiftUI
import Charts

struct ChartData: Identifiable, Equatable {
    let type: String
    let percent: Double
    
    var id: String { return type }
}

struct DynamicChartView: View {
    
    let data = [ChartData(type: "RECI", percent: 44.0),
                ChartData(type: "LEARN CHILD", percent: 19.9)]
    
    var maxChartData: ChartData? {
        data.min { $0.percent < $1.percent }
    }
    
    var body: some View {
        
        Chart {
            ForEach(data) { dataPoint in
                
                BarMark(x: .value("Type", dataPoint.type),
                        y: .value("percent", dataPoint.percent))
                .opacity(maxChartData == dataPoint ? 1 : 0.5)
                .foregroundStyle(maxChartData == dataPoint ? Color.orange : Color.gray)
                
                
            }
         
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
  
    }
}

#Preview {
    DynamicChartView()
}

