//
//  darkmood.swift
//  future contract
//
//  Created by Leen Almejarri on 24/03/1446 AH.
//

import Foundation
import SwiftUI

struct DarkModeBackgroundModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(
                colorScheme == .dark ? Color(red: 0.09, green: 0.16, blue: 0.09) : Color.white
            )
//            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func darkModeBackground() -> some View {
        self.modifier(DarkModeBackgroundModifier())
    }
}
