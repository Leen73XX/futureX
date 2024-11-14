//
//  BaseView.swift
//  future contract
//
//  Created by Leen Almejarri on 24/03/1446 AH.
//

import Foundation
import SwiftUI

struct BaseView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
                .darkModeBackground()
        }
    }
}
