//
//  PetEditView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/26/24.
//

import SwiftUI

struct PetEditView: View {
    @Environment(\.petFamily) private var petGroup
    @Bindable var pet: Pet
    @FocusState var isFocused: Bool
    var body: some View {
        VStack {
            Text(pet.firstName)
            Text(pet.breed)
        }
    }
}

#Preview {
    PetEditView(pet: Pet())
}
