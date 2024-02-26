//
//  NewPetView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/26/24.
//

import SwiftUI

struct NewPetView: View {
    @Environment(PetGroup.self) private var petGroup: PetGroup?
    @Environment(\.dismiss) private var dismiss
    @Bindable var pet: Pet
    var body: some View {
        Form {
            TextField("First Name", text: $pet.name)
                .textFieldStyle(.roundedBorder)
                .onSubmit { dismiss() }
        }
    }
}

#Preview {
    NewPetView(pet: Pet())
}
