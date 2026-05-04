//
//  ContentView.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label("Pokedex", systemImage: "phone.fill")
                }
            AboutView()
                .tabItem {
                        Label("About", systemImage: "info.circle")
                }
        }
    }
}


#Preview {
    DashboardView(); // This must include the view and any input in order to see the preview
}
