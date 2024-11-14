//
//  Projects.swift
//  future contract
//
//  Created by Leen Almejarri on 24/03/1446 AH.
//

import Foundation
import SwiftUI

struct SustainableProjects: View {
    @Environment(\.colorScheme) var colorScheme
    var Projects = [theProject().project1, theProject().project2,theProject().project3]
    @State private var currentNumber: Double = 0
    let targetNumber: Double = 1573.56 // Target number
    let duration: TimeInterval = 2 // Duration in seconds
    
    var body: some View {
        
        NavigationView{
            BaseView{
                VStack(alignment: .leading, spacing: 30){
                    
                    HStack{
                        Text("Sustainable Projects").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).fontWeight(.bold).foregroundColor(colorScheme == .dark ? .white : .black)
                        Spacer()
                       
                    }
                    RoundedRectangle(cornerRadius: 10).frame(width: .infinity,height: 30).opacity(0.1).overlay(
                        HStack {
                            Image(systemName: "magnifyingglass").opacity(0.3)
                            Text("search").opacity(0.3)
                            Spacer()}.padding().foregroundColor(colorScheme == .dark ? .white : .black)
                        
                    )
                    ScrollView{
                      
                      
                        
                                ScrollView (.vertical){
                                    VStack (spacing: 30){
                                        ForEach(0..<Projects.count, id: \.self) { index in
                                            NavigationLink (destination:
                                                                ProjectDetailsView(projectDisplay: Projects[index], isPayment: true, isCalled: false).navigationBarBackButtonHidden()
                                            )
                                            {
                                                
                                                    bigBlock(project: Projects[index])
                                                }
                                            }
                                    }
                        }
//
                        
                     
                        
                    }.padding()
                    
                }.padding()
            }
    }
}
    
}
#Preview {
    SustainableProjects()
       
}

