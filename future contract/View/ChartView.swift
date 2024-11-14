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
    let count: Double
    
    var id: String { return type }
}

struct DynamicChartView: View {
    
    let data = [ChartData(type: "RECI", count: 14678.0),
                ChartData(type: "LEARN CHILD", count: 35867.9),
                ChartData(type: "MY HOME", count: 23788.98)]
    
    var maxChartData: ChartData? {
        data.max { $0.count < $1.count }
    }
    
    var body: some View {
        
        Chart {
            ForEach(data) { dataPoint in
                
                BarMark(x: .value("Type", dataPoint.type),
                        y: .value("Population", dataPoint.count))
                .opacity(maxChartData == dataPoint ? 1 : 0.5)
                .foregroundStyle(maxChartData == dataPoint ? Color.orange : Color.gray)
                
                
            }
            RuleMark(y: .value("Average", 33000))
                .foregroundStyle(.gray)
                .annotation(position: .bottom,
                            alignment: .bottomLeading) {
                    Text("Budget: 35,000")
                }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
  
    }
}

#Preview {
    DynamicChartView()
}

