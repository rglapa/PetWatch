//
//  PetGroup.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/25/24.
//

import SwiftUI
import Observation

@Observable class PetGroup {
    var petFamily: [Pet] = []
    init() {
    }
}
