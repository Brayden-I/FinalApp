//
//  AboutAPIView.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 5/1/26.
//

import SwiftUI

// This is the API Info tab. It shows where the data comes from and who built the app
// This page is hardcoded per the rubric — it doesnt need to fetch anything
struct APIInfoView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // PokeAPI logo at the top
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                } placeholder: {
                    ProgressView()
                }
                .padding(.top, 40)
                .padding(.bottom, 32)

                // Info rows
                VStack(spacing: 0) {
                    infoRow(label: "API Name", value: "PokéAPI")
                    Divider().padding(.leading, 16)
                    infoRow(label: "Website", value: "pokeapi.co")
                    Divider().padding(.leading, 16)
                    infoRow(label: "Developer", value: "Brayden Imada")
                }
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("API Info")
        }
    }

    // Helper view for a single label/value row
    func infoRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
        .padding()
    }
}

#Preview {
    APIInfoView()
}