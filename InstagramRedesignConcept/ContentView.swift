//
//  ContentView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 01/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    
    var body: some View {
        if selectedTab == 0 {
            HomeView(selectedTab: $selectedTab)
        } else if selectedTab == 3 {
            ProfileView(selectedTab: $selectedTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
