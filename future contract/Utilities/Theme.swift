//
//  Theme.swift
//  future contract
//
//  Created by Leen Almejarri on 12/05/1446 AH.
//

import Foundation
import SwiftUI

struct theme {
    static let firstColor =  Color(red: 0.18, green: 1, blue: 0.91)
    static let secondColor = Color(red: 0.6, green: 0.87, blue: 0.3)
    static let thirdColor =  Color(red: 0.93, green: 0.69, blue: 0.26)
   
}

// back button arrow
struct CustomBackButton: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor( Color.accentColor )
                    .font(.body)
            })
    }
}

extension View {
    func customBackButton() -> some View {
        self.modifier(CustomBackButton())
    }
}
