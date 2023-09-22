//
//  Item.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
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
