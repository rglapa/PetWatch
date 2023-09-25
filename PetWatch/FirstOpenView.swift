//
//  FirstOpenView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
//

import SwiftUI

struct FirstOpenView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Open App",destination: ContentView())
        }
    }
}

#Preview {
    FirstOpenView()
}
