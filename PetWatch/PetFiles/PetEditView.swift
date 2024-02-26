//
//  PetEditView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/26/24.
//

import SwiftUI

struct PetEditView: View {
    @Environment(PetGroup.self) private var petGroup: PetGroup?
    @Bindable var pet: Pet
    var body: some View {
        VStack {
            Text(pet.name)
            Text(pet.breed)
        }
    }
}

#Preview {
    PetEditView(pet: Pet())
}
