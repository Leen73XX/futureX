//
//  Item.swift
//  future contract
//
//  Created by Leen Almejarri on 21/03/1446 AH.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
