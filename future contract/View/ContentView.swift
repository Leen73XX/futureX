//
//  ContentView.swift
//  future contract
//
//  Created by Leen Almejarri on 21/03/1446 AH.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var currentPage = 0
    let randomNum : Double = Double.random(in: 99.99 ... 5000)
    var Projects = [theProject().project1, theProject().project2,theProject().project3]
    @State private var currentNumber: Double = 0
    let targetNumber: Double = 1573.56 // Target number
    let duration: TimeInterval = 1 // Duration in seconds
    var body: some View{

            NavigationView{
                BaseView{
                    VStack(alignment: .leading, spacing: 20){
                        HStack{
                            
                            //profile
                            NavigationLink(destination:     profile().navigationBarBackButtonHidden(false)) {
                                HStack(alignment: .center,spacing: 20){
                                    Image("1").resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                    VStack (alignment: .leading){
                                        Text("Michael Tom").font(Font.custom("SF Pro Text", size: 17)).foregroundColor(colorScheme == .dark ? .white : .black)
                                        Text("MichaelTom@").font(Font.custom("SF Pro Text", size: 10)).opacity(0.6).foregroundColor(colorScheme == .dark ? .white : .black)
                                    }
                                    
                                }
                            }
                            Spacer()
                            // analysis page
                            NavigationLink(destination:     analysis().navigationBarBackButtonHidden(true)){
                                Image(systemName: "chart.xyaxis.line").foregroundColor(.green)
                                    .font(Font.custom("SF Pro Text", size: 20))
                            }
                        }.padding(.trailing ,10)
                        RoundedRectangle(cornerRadius: 10).frame(width: .infinity,height: 30).opacity(0.1).overlay(
                            HStack {
                                Image(systemName: "magnifyingglass").opacity(0.3)
                                Text("search").opacity(0.3)
                                Spacer()}.padding().foregroundColor(colorScheme == .dark ? .white : .black)
                            
                        ).padding(.bottom, 10.0)
                        ScrollView{
                            HStack{
                                VStack (alignment:.leading ,spacing: 5){
                                    
                                    Text("Current Balance :").font(.callout).foregroundColor(colorScheme == .dark ? .white : .black)
                                    HStack (spacing: 30){
                                        Text("$ 3,678,230.84").font(.title).foregroundColor(colorScheme == .dark ? .white : .black)
                                        VStack (spacing:0){
                                            Text(" last visit").foregroundColor(.green )
                                            Text(String(format: "+$ %.2f ", currentNumber))
                                                .foregroundColor(.green)
                                                .onAppear {
                                                                   animateNumber(to: (randomNum), duration: duration)
                                                               }
                                     
                                        }
                                    }
                                }
                                Spacer()
                               
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Sustainable Projects").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).fontWeight(.bold).foregroundColor(colorScheme == .dark ? .white : .black)
                                    Text("trend now")
                                        .font(.callout).opacity(0.6)
                                }
                                Spacer()
                                NavigationLink(destination:     SustainableProjects().navigationBarBackButtonHidden(false)) {
                                    Text("see all")
                                    .font(.callout).foregroundColor( Color(hex: "EDAF42"))}
                                
                            }.padding(.top)
                            
                        
                                
                            TabView{
                                    ForEach(0..<Projects.count, id: \.self) { index in
                                        NavigationLink (destination:
                                                            ProjectDetailsView(projectDisplay: Projects[index], isPayment: true, isCalled: false))
                                        {
                                            
                                                bigBlock(project: Projects[index])
                                            }
                                        }
                                }.frame( height: 300.0)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                                
                            
                            HStack{
                                Text("My Projects").font(.title2).fontWeight(.bold).foregroundColor(colorScheme == .dark ? .white : .black)
                                Spacer()
                                NavigationLink(destination:     myProject().navigationBarBackButtonHidden(false)) {
                                    Text("see all")
                                    .font(.callout).font(.callout).foregroundColor( Color(hex: "EDAF42"))}
                            }.padding(.top)
                            ScrollView (.horizontal){
                                HStack (spacing: 20){
                                    ForEach(0..<Projects.count - 1, id: \.self) { index in
                                        NavigationLink (destination:
                                                            ProjectDetailsView(projectDisplay: Projects[index], isPayment: false))
                                        {
                                            if (index == 0){
                                                smallBlock(project: Projects[index], up: true)
                                            } else {
                                                smallBlock(project: Projects[index], up: false)
                                            }
                                        }
                                    }
                                    
                                }}
                        }
                        
                        
                    }.padding()
                }
        }
    }
      
    func formattedDouble(_ value: Double) -> String {
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           formatter.minimumFractionDigits = 2 // Minimum number of decimal places
           formatter.maximumFractionDigits = 3 // Maximum number of decimal places
           return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
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
#Preview {
    ContentView()
    
        .modelContainer(for: Item.self, inMemory: true)
}
