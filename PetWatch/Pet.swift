//
//  Pet.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
//

import Foundation
import SwiftData

@Model
final class Pet {
    var firstName: String
    var lastName: String
    var breed: String
    var age: Int?
    var weight: Int?
    
    init(firstName: String, lastName: String, breed: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.breed = breed
    }
}
