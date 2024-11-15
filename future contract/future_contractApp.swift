//
//  future_contractApp.swift
//  future contract
//
//  Created by Leen Almejarri on 21/03/1446 AH.
//

import SwiftUI
import SwiftData
import TipKit

@main
struct future_contractApp: App {
 
    init() {
        try? Tips.configure()
    }
 

    var body: some Scene {
        
        WindowGroup {
            SplashScreenView()
                .darkModeBackground()
        }
     
    }
}
