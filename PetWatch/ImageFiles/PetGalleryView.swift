//
//  PetGalleryView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 11/24/23.
//

import SwiftUI
import SwiftData

struct PetGalleryView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PetGalleryView().modelContainer(for: PetPhotoLibraryModel.self, inMemory: true)
}
