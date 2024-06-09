//
//  Pet.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/25/24.
//
import Foundation
import SwiftUI
import SwiftData

@Model
final class Pet {
    let id: UUID
    var firstName: String
    var lastName: String
    var breed: String
    var petImage: Data?
    
    init() {
        id = UUID()
        firstName = ""
        lastName = ""
        breed = ""
    }
    
    
    init(id: UUID = UUID(), firstName: String, lastName: String,breed: String, petImage: Data?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.breed = breed
        self.petImage = petImage
    }
}
