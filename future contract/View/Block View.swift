//
//  Block View.swift
//  future contract
//
//  Created by Leen Almejarri on 22/03/1446 AH.
//

import Foundation
import SwiftUI

struct bigBlock : View {
    var project : Project
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 330, height: 230)
            .foregroundColor(.clear)
            .background(
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.18, green: 1, blue: 0.91), location: 0.02),
            Gradient.Stop(color: Color(red: 0.6, green: 0.87, blue: 0.3), location: 0.34),
            Gradient.Stop(color: Color(red: 0.93, green: 0.69, blue: 0.26), location: 0.84),
            ],
            startPoint: UnitPoint(x: 0.84, y: 0.09),
            endPoint: UnitPoint(x: 0.08, y: 1.2)
            )
            )
            .cornerRadius(24)
            .overlay(
                ZStack (alignment: .bottomLeading){
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 330, height: 230)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0), location: 0.00),
                                    Gradient.Stop(color: .black.opacity(0.8), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                        )
                        .cornerRadius(24)
                      
                    Text(project.name)
                        .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding([.leading, .bottom])
                }
            )
    }
}

struct smallBlock: View {
    var project : Project
    var up :Bool
    @State private var currentNumber: Double = 0
    let targetNumber: Double = 1573.56 // Target number
    let duration: TimeInterval = 1 // Duration in seconds
    var body: some View {
        if up {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 100, height: 100)
                .foregroundColor(.clear)
                .background(
                    
                    LinearGradient(
                        
                        stops: [
                            Gradient.Stop(color: Color(red: 0.18, green: 1, blue: 0.91), location: 0.02),
                            Gradient.Stop(color: Color(red: 0.6, green: 0.87, blue: 0.3), location: 0.34),
                            Gradient.Stop(color: Color(red: 0.93, green: 0.69, blue: 0.26), location: 0.84),
                        ],
                        startPoint: UnitPoint(x: 0.84, y: 0.09),
                        endPoint: UnitPoint(x: 0.08, y: 1.2)
                    )
                )
                .cornerRadius(16)
                .overlay(
                    ZStack (alignment: .center){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 100)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0), location: 0.00),
                                        Gradient.Stop(color: .black.opacity(0.8), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                )
                            )
                            .cornerRadius(16)
                        VStack (spacing: 2){
                            Image(systemName: "arrowshape.up")
                                .font(Font.custom("SF Pro Text", size: 25)) .foregroundColor(Color.white)
                            
                            Text(String(format: "+$ %.1f ", currentNumber))
                                
                                .onAppear {
                                    animateNumber(to: Double((project.balance)), duration: duration)
                                               }
                                .font(Font.custom("SF Pro Text", size: 15))
                                .foregroundColor(.white)
                            Text(project.name)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                            
                        }.padding()
                    }
                )
        } else {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 100, height: 100)
                .foregroundColor(.gray).opacity(0.6)
                .overlay(
                    ZStack (alignment: .bottomLeading){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 100)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0), location: 0.00),
                                        Gradient.Stop(color: .black.opacity(0.8), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                )
                            )
                            .cornerRadius(16)
                        VStack (alignment:.center ,spacing: 2){
                           
                            
                            Text(String(format: "+$ %.1f ",project.balance))
                                .font(Font.custom("SF Pro Text", size: 15))
                                .foregroundColor(.white)
                            Text(project.name)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }.padding([.leading, .bottom], 20.0)
                    })
        }
    }
    func animateNumber(to target: Double, duration: TimeInterval) {
           let step = target / (duration * 60) // Assuming 60 FPS
           var total: Double = 0
           var currentStep: Double = 0
           
           Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
               total += step
               currentNumber = min(total, target) // Ensure we don't go over the target
               
               if currentNumber >= target {
                   timer.invalidate() // Stop the timer once we reach the target
               }
           }
       }
}
