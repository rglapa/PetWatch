//
//  Pet.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/25/24.
//

import SwiftUI
import Observation

@Observable class Pet: Identifiable {
    var name: String = "Sample Pet"
    var breed: String = "Poodle"
}
