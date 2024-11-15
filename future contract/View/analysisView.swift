//
//  analysis.swift
//  future contract
//
//  Created by Leen Almejarri on 29/04/1446 AH.
//

import Foundation
import SwiftUI

struct analysis: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showInfoSheet = false
    
    var Projects = [theProject().project1, theProject().project2, theProject().project3]
    var body: some View {
        NavigationView {
            BaseView {
                VStack(alignment: .leading, spacing: 30) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            MyProjectsRevenueView()
                            BudgetConsumptionView()
                            PutView()
                            CallProjectsView()
                        }
                        .padding(.top, 10.0)
                        .padding()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Analysis")
                        .foregroundColor(.white)
                        .accessibilityLabel("Analysis")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical)
                }
                ToolbarItem{
                    Button(action:{
                        showInfoSheet = true
                    }){
                        Image(systemName: "info.circle").foregroundColor(.accent)
                    }
                }
               
                }
            
            .customBackButton()
            .sheet(isPresented: $showInfoSheet) {
                    InfoSheetView()
                }
        }
    }
}

struct MyProjectsRevenueView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Projects Goal Track")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.medium)
            
            Text("in Percentage")
                .foregroundColor(.white)
                .fontWeight(.thin)
            
            RoundedRectangle(cornerRadius: 16)
                .frame(width: .infinity, height: 420)
                .opacity(0.1)
                .overlay(
                    LineChartExampleView()
                        .foregroundColor(.primary)
                )
        }
    }
}

struct BudgetConsumptionView: View {
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Budget consumption")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.medium)
            
            Text("How much do your projects consume from the existing budget?")
                .foregroundColor(.white)
                .fontWeight(.thin)
            
            RoundedRectangle(cornerRadius: 16)
                .frame(width: .infinity, height: 380)
                .opacity(0.1)
                .overlay(
                    VStack(alignment: .leading) {
                        Spacer()
                        PieChartExampleView()
                        Spacer()
                        BudgetLegendView()
                    }
                    .padding(30)
                    .foregroundColor( .white )
                )
        }
    }
}

struct BudgetLegendView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Rectangle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(red: 0.18, green: 1, blue: 0.91))
                Text("LEARN CHILD")
                    .font(.footnote)
            }
            HStack {
                Rectangle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(red: 0.18, green: 1, blue: 0.91))
                    .opacity(0.5)
                Text("RECI")
                    .font(.footnote)
            }
        }
    }
}

struct PutView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showPutSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Warning ")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.medium)
            
            HStack{
                Text("FuturXs advises you to pay attention to this project because it appears to be less successful so far")
                    .foregroundColor(.white)
                    .fontWeight(.thin)
                Spacer()
                Button(action: {
                    showPutSheet = true
                }){
                    
                    Text("Put").foregroundColor(Color.orange)
                }
            }
            RoundedRectangle(cornerRadius: 16)
                .frame(width: .infinity, height: 400)
                .opacity(0.1)
                .overlay(
                    DynamicChartView()
                        .padding()
                        .foregroundColor(.white )
                )
                .sheet(isPresented: $showPutSheet) {
                    PutSheetView(isCklicked: false)
                              }
        }
    }
}

struct CallProjectsView: View {
    var Projects = [theProject().project1, theProject().project2, theProject().project3]
    @State private var showCallSheet = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Call Projects")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top)
            HStack{
                Text("These projects achieved the goal!")
                    .foregroundColor(.white)
                    .fontWeight(.thin)
                Spacer()
                Button(action: {
                    showCallSheet = true
                }){
                    Text("Call").foregroundColor(Color.orange)
                }
            }
            HStack {
                Spacer()
              
            }
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<Projects.count - 2, id: \.self) { index in
                       
                            smallBlock(project: Projects[index], up: true)
                        
                    }
                }
            }
            .sheet(isPresented: $showCallSheet) {
                CallSheetView(isCklicked: false)
                          }
        }
    }
}

#Preview {
    analysis()
}



   
