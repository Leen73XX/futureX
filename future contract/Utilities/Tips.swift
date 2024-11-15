//
//  Tips.swift
//  future contract
//
//  Created by Leen Almejarri on 13/05/1446 AH.
//

import Foundation
import TipKit



struct AnalysisTip: Tip {
    var title: Text {
        Text("analysis here")
    }
    
    var message: Text? {
        Text("You can see all analysis of your contracts and perform put or call here!")
    }
}

