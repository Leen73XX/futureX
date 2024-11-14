//
//  PetModelEx.swift
//  future contract
//
//  Created by Leen Almejarri on 12/05/1446 AH.
//

import Foundation

struct ProjectData: Identifiable, Equatable {
    let year: Int
    
    let revenue: Double
    
    var id: Int { year }
    
    static var RECIData: [ProjectData] {
        [ProjectData(year: 2019, revenue: 6.6),
         ProjectData(year: 2020, revenue: 6.8),
         ProjectData(year: 2021, revenue: 8.2),
         ProjectData(year: 2022, revenue: 12.9),
         ProjectData(year: 2023, revenue: 15.2),
         ProjectData(year: 2024, revenue: 16)
        ]
    }
    
    static var LearnChildData: [ProjectData] {
        [ProjectData(year: 2019, revenue: 4.2),
         ProjectData(year: 2020, revenue: 5),
         ProjectData(year: 2021, revenue: 5.3),
         ProjectData(year: 2022, revenue: 7.9),
         ProjectData(year: 2023, revenue: 10.6),
         ProjectData(year: 2024, revenue: 11)]
    }
    
}
