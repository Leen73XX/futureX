//
//  SplashScreenView.swift
//  future contract
//
//  Created by Leen Almejarri on 24/03/1446 AH.
//

import Foundation
import SwiftUI
struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.01
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                LinearGradient(
                stops: [
                Gradient.Stop(color: Color(red: 0.18, green: 1, blue: 0.91), location: 0.02),
                Gradient.Stop(color: Color(red: 0.6, green: 0.87, blue: 0.3), location: 0.34),
                Gradient.Stop(color: Color(red: 0.93, green: 0.69, blue: 0.26), location: 0.84),
                ],
                startPoint: UnitPoint(x: 0.84, y: 0.09),
                endPoint: UnitPoint(x: 0.08, y: 1.2)
                )
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Image( systemName: "dollarsign.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.5)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

