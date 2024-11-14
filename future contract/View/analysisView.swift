//
//  analysis.swift
//  future contract
//
//  Created by Leen Almejarri on 29/04/1446 AH.
//

import Foundation
import SwiftUI


struct analysis : View {
    @Environment(\.colorScheme) var colorScheme
   
    var Projects = [theProject().project1, theProject().project2,theProject().project3]
    var body: some View {
        NavigationView{
            BaseView{
                
                VStack(alignment: .leading, spacing: 30){
                    ScrollView{
                        VStack(alignment: .leading) {
                            Text("My Projects revenue")
                                .font(.title)
                                .fontWeight(.medium)
                               
                            Text(" in Millions")
                                .fontWeight(.thin)
                            RoundedRectangle(cornerRadius: 16).frame(width: .infinity,height: 420).opacity(0.1).overlay(
                                
                                
                                LineChartExampleView()
                                
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                
                            )
                        }
                        VStack(alignment: .leading) {
                            Text("Budget consumption")
                                .font(.title)
                                .fontWeight(.medium)
                               
                            Text(" How much do your projects consume from the existing budget?")
                                .fontWeight(.thin)
                            RoundedRectangle(cornerRadius: 16).frame(width: .infinity,height: 380).opacity(0.1).overlay(
                                
                                VStack(alignment: .leading){
                                    Spacer()
                                    PieChartExampleView()
                                    Spacer()
                                    HStack{
                                        Rectangle().frame(width: 10, height: 10).foregroundColor(Color(red: 0.18, green: 1, blue: 0.91))
                                        Text("LEARN CHILD")
                                            .font(.footnote)
                                    }
                                    HStack{
                                        Rectangle().frame(width: 10, height: 10).foregroundColor(Color(red: 0.18, green: 1, blue: 0.91)).opacity(0.5)
                                        Text("RECI")
                                            .font(.footnote)
                                    }
                                }.padding(30)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                
                            )
                        }.padding(.top)
                        VStack(alignment: .leading) {
                            Text("acceed the budget")
                                .font(.title)
                                .fontWeight(.medium)
                            
                            Text("be careful with this project!")
                                .fontWeight(.thin)
                            RoundedRectangle(cornerRadius: 16).frame(width: .infinity,height: 400).opacity(0.1).overlay(
                                HStack {
                                    DynamicChartView()
                                }.padding().foregroundColor(colorScheme == .dark ? .white : .black)
                                
                            )
                        }.padding(.top)
                       
                        Spacer()
                        HStack{
                            VStack (alignment: .leading){
                                Text("Call Projects").font(.title2).fontWeight(.bold).foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("this projects achived the goal!")
                                    .fontWeight(.thin)
                            }
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
                                        
                                            smallBlock(project: Projects[index], up: true)
                                        
                                            
                                        
                                    }
                                }
                                
                            }}

                    }.padding(.top, 10.0)
                        .padding()
                }
               
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Analysis")
                        .accessibilityLabel("Analysis")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                }
            }
            .customBackButton()
        }
    }
}

#Preview {
    analysis()
}

   
