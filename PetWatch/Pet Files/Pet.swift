//
//  Pet.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
//

import Foundation
import SwiftData
import PhotosUI
import SwiftUI
import CoreTransferable

@Model
class Pet: ObservableObject {
    var firstName: String
    var lastName: String
    var breed: String
    var petAge: String
    var petWeight: String
    var petNotes: String
    var imageData : Data?
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.breed = ""
        self.petAge = ""
        self.petWeight = ""
        self.petNotes = ""
        self.imageData = Data()
    }
    
    init(firstName: String, 
         lastName: String,
         breed: String,
         petAge: String,
         petWeight: String,
         petNotes: String,
         image: Data) {
        self.firstName = firstName
        self.lastName = lastName
        self.breed = breed
        self.petAge = petAge
        self.petWeight = petWeight
        self.petNotes = petNotes
        self.imageData = image
    }
}
