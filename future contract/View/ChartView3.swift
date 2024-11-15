//
//  ChartView3.swift
//  future contract
//
//  Created by Leen Almejarri on 12/05/1446 AH.
//

import Foundation

import SwiftUI
import Charts

@available(macOS 14.0, *)
struct PieChartExampleView: View {
    
    let RECIData = ProjectData.RECIData
    let LearnChildData = ProjectData.LearnChildData
    
    
    var RECITotal: Double {
        RECIData.reduce(0) { $0 + $1.percent }
    }
    
    var LearnChildTotal: Double {
        LearnChildData.reduce(0) { $0 + $1.percent }
    }
    
    var data: [(type: String, amount: Double)] {
        [(type: "RECI", amount: RECITotal),
         (type: "LearnChild", amount: LearnChildTotal)
        ]
    }
    
    var minData: String? {
        data.max { $0.amount < $1.amount }?.type
    }
    
    var body: some View {
        
        Chart(data, id: \.type) { dataItem in
            SectorMark(angle: .value("Type", dataItem.amount),
                       innerRadius: .ratio(0.5),
                       angularInset: 2)
                .cornerRadius(5)
                .foregroundStyle(Color(red: 0.18, green: 1, blue: 0.91))
                .opacity(dataItem.type == minData ? 1 : 0.5)
        }
        .frame(height: 200)
      
    }
}

@available(macOS 14.0, *)
#Preview {
    PieChartExampleView()
}
