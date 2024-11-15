//
//  ContentView2.swift
//  future contract
//
//  Created by Leen Almejarri on 12/05/1446 AH.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: .infinity, height: 30)
            .opacity(0.1)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass").opacity(0.3)
                    Text("search").opacity(0.3)
                    Spacer()
                }
                .padding()
                .foregroundColor(.white )
            )
            .padding(.bottom, 10.0)
    }
}

struct CurrentBalanceView: View {
    @State private var currentNumber: Double = 0
    let randomNum: Double = Double.random(in: 99.99 ... 5000)
    let duration: TimeInterval = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Current Balance :")
                .font(.callout)
                .foregroundColor(.white)
            
            HStack(spacing: 30) {
                Text("$ 3,678,230.84")
                    .font(.title)
                    .foregroundColor(.white)
                
                VStack(spacing: 0) {
                    Text("last visit").foregroundColor(.green)
                    Text(String(format: "+$ %.2f ", currentNumber))
                        .foregroundColor(.green)
                        .onAppear {
                            animateNumber(to: randomNum, duration: duration)
                        }
                }
            }
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
struct ProjectsTabView: View {
    var Projects: [Project]
    
    var body: some View {
        TabView {
            ForEach(0..<Projects.count, id: \.self) { index in
                NavigationLink(destination: ProjectDetailsView(projectDisplay: Projects[index], isPayment: true)) {
                    bigBlock(project: Projects[index])
                }
            }
        }
        .frame(height: 300.0)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}
struct MyProjectsSection: View {
    var Projects: [Project]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("My Projects")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white )
                Spacer()
                NavigationLink(destination: myProject().navigationBarBackButtonHidden(false)) {
                    Text("see all")
                        .font(.callout)
                        .foregroundColor(Color(hex: "EDAF42"))
                }
            }
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<Projects.count - 1, id: \.self) { index in
                        NavigationLink(destination: ProjectDetailsView(projectDisplay: Projects[index], isPayment: false)) {
                            if (index == 0) {
                                smallBlock(project: Projects[index], up: true)
                            } else {
                                smallBlock(project: Projects[index], up: false)
                            }
                        }
                    }
                }
            }
        }
        .padding(.top)
    }
}

