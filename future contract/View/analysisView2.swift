//
//  analysisView2.swift
//  future contract
//
//  Created by Leen Almejarri on 13/05/1446 AH.
//

import Foundation
import SwiftUI

struct CallSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedProject = ""
    let projects: [String] = [theProject().project1.name]
    let projectsCall = [theProject().project1.CallGain]
    @State var isCklicked : Bool
    @State var isEmpty = true
    var body: some View {
        NavigationView {
            BaseView {
                ZStack{
                    Rectangle().foregroundColor(.clear).frame(width: .infinity,height: .infinity)
                    VStack( spacing: 10) {
                        VStack(alignment: .leading){
                            Text("Call Operation")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            
                            Text("Select project")
                                .font(.title2).padding(.top, 20)
                            
                            projectMenu
                            
                            Button(action:{
                                if !isEmpty {
                                    isCklicked = true
                                } else {
                                    
                                }
                                
                            }){
                                RoundedRectangle(cornerRadius: 16).foregroundColor(.accent)
                                    .frame(width: 300,height: 50)
                                    .overlay(
                                        Text("Call")
                                        
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                    )
                            }.padding(.vertical, 20)
                        }
                        Spacer()
                        if isCklicked{
                            if !isEmpty{
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 250, height: 200)
                                    .foregroundColor(.white).opacity(0.1)
                                    .overlay(
                                VStack (spacing: 5){
                                    Text("Done!")
                                        .font(.title).fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("congratulations! you gain :").font(.body).foregroundColor(.white)
                                    Text("$ \(projectsCall[projects.firstIndex(of: selectedProject)!])").font(.title2).fontWeight(.bold).foregroundColor(.accent)
                                    
                                }.padding()
                                )
                            }else {
                                Text("Please select project")
                                
                            }
                        }
                        Spacer()
                        Spacer()
                    }
                        .navigationBarItems(trailing: Button("Done") {
                            dismiss()
                        })
                }
            }
        }
    }
    
    private var projectMenu: some View {
        
        Menu {
            ForEach(projects, id: \.self) { project in
                Button(action: {
                    selectedProject = project
                    isEmpty = false
                }) {
                    Text(project)
                }
            }
        } label: {
            HStack {
                Image(systemName: "chevron.down")
                    .foregroundColor(.white)
                Text(selectedProject.isEmpty ? "select project" : selectedProject)
                    .foregroundColor(.white).opacity(0.5)
            }
            .padding()
        }
    }
}
struct PutSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedProject = ""
    let projects: [String] = [theProject().project2.name]
    let projectsCall = [theProject().project2.PutGain]
    @State var isCklicked : Bool
    @State var isEmpty = true
    var body: some View {
        NavigationView {
            BaseView {
                ZStack{
                    Rectangle().foregroundColor(.clear).frame(width: .infinity,height: .infinity)
                    VStack( spacing: 10) {
                        VStack(alignment: .leading){
                            Text("Call Operation")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            
                            Text("Select project")
                                .font(.title2).padding(.top, 20)
                            
                            projectMenu
                            
                            Button(action:{
                                if !isEmpty {
                                    isCklicked = true
                                } else {
                                    
                                }
                                
                            }){
                                RoundedRectangle(cornerRadius: 16).foregroundColor(.orange)
                                    .frame(width: 300,height: 50)
                                    .overlay(
                                        Text("Put")
                                        
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                    )
                            }.padding(.vertical, 20)
                        }
                        Spacer()
                        if isCklicked{
                            if !isEmpty{
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 250, height: 200)
                                    .foregroundColor(.white).opacity(0.1)
                                    .overlay(
                                VStack (spacing: 5){
                                    Text("Done!")
                                        .font(.title).fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("you reduced your losses! you gain:").font(.body).foregroundColor(.white)
                                    Text("$ \(projectsCall[projects.firstIndex(of: selectedProject)!])").font(.title2).fontWeight(.bold).foregroundColor(.orange)
                                    
                                }.padding()
                                )
                            }else {
                                Text("Please select project")
                                
                            }
                        }
                        Spacer()
                        Spacer()
                    }
                        .navigationBarItems(trailing: Button("Done") {
                            dismiss()
                        })
                }
            }
        }
    }
    
    private var projectMenu: some View {
        
        Menu {
            ForEach(projects, id: \.self) { project in
                Button(action: {
                    selectedProject = project
                    isEmpty = false
                }) {
                    Text(project)
                }
            }
        } label: {
            HStack {
                Image(systemName: "chevron.down")
                    .foregroundColor(.white)
                Text(selectedProject.isEmpty ? "select project" : selectedProject)
                    .foregroundColor(.white).opacity(0.5)
            }
            .padding()
        }
    }
}
struct InfoSheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            BaseView {
                ScrollView{
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Information about Call and Put").foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        VStack (alignment:.leading ,spacing: 5){
                            Text("Put and Call Options")
                                .font(.title).foregroundColor(.orange)
                            Text("Options are financial contracts that give the buyer the right, but not the obligation, to buy (call) or sell (put) an underlying asset at a predetermined price within a specific time frame.")
                                .font(.body)
                        }
                        VStack (alignment:.leading ,spacing: 5){
                            Text("Call Options")
                                .font(.title).foregroundColor(.orange)
                            Text("A call option gives the holder the right to buy an underlying asset at a set price (strike price) before the option expires. Investors typically buy call options when they believe the price of the underlying asset will increase. ")
                                .font(.body)
                        }
                        VStack (alignment:.leading ,spacing: 5){
                            Text("Put Options")
                                .font(.title).foregroundColor(.orange)
                            Text("A put option gives the holder the right to sell an underlying asset at a set price before the option expires. Investors typically buy put options when they expect the price of the underlying asset to decrease. ")
                                .font(.body)
                        }
                        Spacer()
                    }
                    .padding()
                    .navigationBarItems(trailing: Button("Done") {
                        dismiss()
                    })
                }
            }
        }
    }
}
