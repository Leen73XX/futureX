//
//  ProjectView.swift
//  future contract
//
//  Created by Leen Almejarri on 28/03/1446 AH.
//

import Foundation
import SwiftUI
import PassKit

struct ProjectDetailsView :View {
    @Environment(\.colorScheme) var colorScheme
    var projectDisplay : Project
    var isPayment : Bool
    var isCalled: Bool
    var body: some View {
       
        NavigationView{
            BaseView{
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text(projectDisplay.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).foregroundColor(colorScheme == .dark ? .white : .black)
                        
                       
                    }.padding(.horizontal)
                    ScrollView{
                        VStack (alignment: .leading, spacing: 20){
                            bigBlock(project: projectDisplay)
                            
                            VStack (alignment: .leading, spacing: 5){
                                Text("Objectives:").font(.title2).fontWeight(.bold)
                                Text(projectDisplay.Objective)
                            }
                            Text("Success rate : %\(projectDisplay.SuccessRate)").fontWeight(.heavy).foregroundColor(.green)
                            
                            
                            VStack (alignment: .leading, spacing: 5) {
                                Text("Potential returns").font(.title2).fontWeight(.bold)
                                
                            
                                VStack (alignment:.leading ,spacing: 30){
                                    Text("When achieving goals").foregroundColor( Color(hex: "EDAF42"))
                                    HStack (spacing: 40){
                                        VStack{
                                            Image(systemName: projectDisplay.potintialReturn1Icon).resizable().frame(width: 50.0, height: 50.0).foregroundColor(.accentColor)
                                            Text(projectDisplay.PotentialReturn1)
                                                .font(.headline)
                                        }
                                        VStack{
                                            Image(systemName: projectDisplay.potintialReturn2Icon).resizable().frame(width: 50.0, height: 50.0).foregroundColor(.accentColor)
                                            Text(projectDisplay.PotentialReturn2)
                                                .font(.headline)
                                        }
                                        VStack{
                                            Image(systemName: projectDisplay.potintialReturn3Icon).resizable().frame(width: 50.0, height: 35.0).foregroundColor(.accentColor)
                                            Text(projectDisplay.PotentialReturn3)
                                                .font(.headline)
                                        }
                                    }
                                }
                            }.padding(.vertical)
                            VStack (alignment: .leading){
                                Text("Timeline")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                ZStack{
                                    RoundedRectangle(cornerRadius: 24.0).frame(height: 150).opacity(0.5).foregroundColor(.gray)
                                    Image("vector1").resizable().frame(width: .infinity,height: 30)
                                        .padding()
                                    }
                            }
                            VStack (alignment: .leading, spacing: 10){
                                Text("Potintial Revenue:").font(.title).fontWeight(.bold).foregroundColor( Color(hex: "EDAF42"))
                                Text(projectDisplay.potintialRisks)
                            }.padding(.top)
                            VStack (alignment: .leading, spacing: 10){
                                Text("Mitigation strategy:").font(.title3).fontWeight(.bold).foregroundColor(.accentColor)
                                Text(projectDisplay.MitigationStrategy)
                            }.padding(.top)
                        } // Vstack
                        
                    }.padding(10)
                    if isPayment{
                        HStack (alignment: .center){
                            Spacer()
                            ApplePayButton(action: {
                                // Handle Apple Pay button tap
                                print("Apple Pay button tapped")
                                // Here you would typically call your payment processing function
                            })
                            .frame(width: 250.0, height: 50).cornerRadius(16)
                            .background(Color(.clear))
                            Spacer()
                        }.frame(height: 5)
                    } else {
                        if isCalled{
                            Rectangle()
                                .cornerRadius(16)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color.accentColor).overlay(
                                
                                    Text("Call").fontWeight(.bold).foregroundColor(.white)
                            )
                        }
                    }
                }.padding()
                
            }
    }
}
}
struct ApplePayButton: UIViewRepresentable {
    var action: () -> Void

    func makeUIView(context: Context) -> PKPaymentButton {
        let button = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: PKPaymentButton, context: Context) {
        // Update the button if needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }

    class Coordinator {
        var action: () -> Void

        init(action: @escaping () -> Void) {
            self.action = action
        }

        @objc func buttonTapped() {
            action()
        }
    }
}
#Preview {
    ProjectDetailsView( projectDisplay: Project(name: "SADAYA", Objective: "kjhjgfcdxszrzxtcfygvuhbijn", SuccessRate: 89, PotentialReturn1: "koijhgfdsd", PotentialReturn2: "iuygftdse", PotentialReturn3: "kjhv hujybin", potintialRisks: "miuytfrdeswerftgyhjkoijuhgfdertyui", MitigationStrategy: "jbhuvuvhbd dbveiur erjkbfuir", BudgetDetail1: [20:"development"], balance: 400, potintialReturn1Icon: "dollarsign.circle",potintialReturn2Icon: "",potintialReturn3Icon: ""), isPayment: true, isCalled: true)
}
