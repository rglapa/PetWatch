//
//  Item.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/25/24.
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
