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
    var Projects = [theProject().project1, theProject().project2,theProject().project3]
    let targetNumber: Double = 1573.56 // Target number
    
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
                                        Text("Michael Tom").font(Font.custom("SF Pro Text", size: 17)).foregroundColor(.white)
                                        Text("MichaelTom@").font(Font.custom("SF Pro Text", size: 10)).opacity(0.6).foregroundColor(.white )
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
                        SearchBarView()
                        ScrollView{
                            HStack{
                                CurrentBalanceView()
                                Spacer()
                               
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Sustainable Projects").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).fontWeight(.bold).foregroundColor(.white )
                                    Text("trend now")
                                        .font(.callout).opacity(0.6)
                                }
                                Spacer()
                                NavigationLink(destination:     SustainableProjects().navigationBarBackButtonHidden(false)) {
                                    Text("see all")
                                    .font(.callout).foregroundColor( Color(hex: "EDAF42"))}
                                
                            }.padding(.top)
                            
                            ProjectsTabView(Projects: Projects)
                                
                            
                            HStack{
                                Text("My Projects").font(.title2).fontWeight(.bold).foregroundColor( .white)
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
                                }
                            }
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
  
}


#Preview {
    ContentView()
    
        .modelContainer(for: Item.self, inMemory: true)
}
