//
//  AboutView.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/29/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("About")
                    .font(.largeTitle)
                    .bold()
                Text("This is the Pokedex iOS app. It is a demo of a SwiftUI app that fetches and displays data from the PokeAPI. This was made for Ms. Markley's Mobile app development class.")
                
                Divider()
                
                Text("Contributors")
                    .font(.largeTitle)
                    .bold()
                
                // Persons
                Text("- Brayden Imada")
                    .font(.headline)
                Text("Main solo developer of project")
                    .font(.caption)
            }
        }
    }
}

#Preview {
    AboutView()
}
