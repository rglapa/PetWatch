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
    var imageData : Data?
    
    
    /*var imageSelection: PhotosPickerItem? = nil {
        didSet {
            if let imageSelection {
                let progress = loadTransferable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }*/
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.breed = ""
        self.petAge = ""
        self.petWeight = ""
    }
    
    init(firstName: String, lastName: String, breed: String, petAge: String, petWeight: String, image: Data) {
        self.firstName = firstName
        self.lastName = lastName
        self.breed = breed
        self.petAge = petAge
        self.petWeight = petWeight
        self.imageData = image
    }
}
