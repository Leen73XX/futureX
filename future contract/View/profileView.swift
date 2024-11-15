//
//  profile.swift
//  future contract
//
//  Created by Leen Almejarri on 28/03/1446 AH.
//

import Foundation
import SwiftUI

struct profile : View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View
    {
        BaseView{
            VStack(alignment: .leading, spacing: 20){
              

                HStack{
                    Spacer()
                    
                    Image("1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(100)
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 16).frame(width: .infinity,height: 50).opacity(0.1).overlay(
                    HStack {
                        
                        Text("wallet balance")
                        Spacer()
                        Text("$ 3,678,230.84").foregroundColor(.green)
                        Image(systemName: "chevron.right")
                    }.padding().foregroundColor(.white )
                    
                )
                
                RoundedRectangle(cornerRadius: 16).frame(width: .infinity,height: 50).opacity(0.1).overlay(
                    HStack {
                        
                        Text("Phone number")
                        Spacer()
                        Text("+966500000000")
                        
                    }.padding().foregroundColor(.white )
                    
                )
                
                HStack{
                    Spacer()
                    Image(systemName: "square.and.arrow.up").rotationEffect(.degrees(90))
                    Text("Log uot")
                    Spacer()
                }.foregroundColor(.accentColor)
               Spacer()
               

            }.padding(.top, 10.0)
                .padding()
              
        }
    }
}

#Preview {
    profile()
}
