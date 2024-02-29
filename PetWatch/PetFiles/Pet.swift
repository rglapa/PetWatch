//
//  Pet.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/25/24.
//

import SwiftUI
import Observation

@Observable class Pet: Identifiable {
    var firstName: String = "Sample"
    var lastName: String = "Pet"
    var breed: String = "Poodle"
    var petPhoto: Image?
    
    init() {
        firstName = ""
        lastName = ""
        breed = ""
    }
}
