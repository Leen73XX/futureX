//
//  ChartView2.swift
//  future contract
//
//  Created by Leen Almejarri on 12/05/1446 AH.
//

import Foundation
import SwiftUI
import Charts

struct LineChartExampleView: View {
    let RECIData = ProjectData.RECIData
    let LearnChildData = ProjectData.LearnChildData
    
    var data: [(type: String, Data: [ProjectData])] {
        [(type: "RECI", Data: RECIData),
         (type: "LEARNCHILD", Data: LearnChildData)]
    }
    
    var body: some View {
        Chart(data, id: \.type) { dataSeries in
            ForEach(dataSeries.Data) { data in
                LineMark(x: .value("Year", data.year),
                         y: .value("percent", data.percent))
            }
            .foregroundStyle(by: .value("project", dataSeries.type))
            .symbol(by: .value("project", dataSeries.type))
        }
        .chartXScale(domain: 2019...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    LineChartExampleView()
}
