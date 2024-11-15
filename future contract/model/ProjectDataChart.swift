//
//  PetModelEx.swift
//  future contract
//
//  Created by Leen Almejarri on 12/05/1446 AH.
//

import Foundation

struct ProjectData: Identifiable, Equatable {
    let year: Int
    
    let percent: Double
    
    var id: Int { year }
    
    static var RECIData: [ProjectData] {
        [ProjectData(year: 2019, percent: 6.6),
         ProjectData(year: 2020, percent: 6.8),
         ProjectData(year: 2021, percent: 8.2),
         ProjectData(year: 2022, percent: 12.9),
         ProjectData(year: 2023, percent: 15.2),
         ProjectData(year: 2024, percent: 16)
        ]
    }
    
    static var LearnChildData: [ProjectData] {
        [ProjectData(year: 2019, percent: 4.2),
         ProjectData(year: 2020, percent: 5),
         ProjectData(year: 2021, percent: 5.3),
         ProjectData(year: 2022, percent: 7.9),
         ProjectData(year: 2023, percent: 10.6),
         ProjectData(year: 2024, percent: 11)]
    }
    
}
