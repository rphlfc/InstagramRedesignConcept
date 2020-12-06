//
//  ContentView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 01/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    @State var showPostView = false
    @Namespace var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            if selectedTab == 0 {
                HomeView(selectedTab: $selectedTab, showPostView: $showPostView, animation: animation)
            } else if selectedTab == 3 {
                ProfileView(selectedTab: $selectedTab)
            }
            
            if showPostView {
                PostView(showPostView: $showPostView, animation: animation)
            }
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
