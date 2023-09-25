//
//  Pet.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
//

import Foundation
import SwiftData
import PhotosUI
@Model
final class Pet {
    var firstName: String
    var lastName: String
    var breed: String
    var age: Int?
    var weight: Int?
    var image: Data?
    
    init(firstName: String, lastName: String, breed: String, age: Int? = nil, weight: Int? = nil, image: Data? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.breed = breed
        self.age = age
        self.weight = weight
        self.image = image
    }
    
}
