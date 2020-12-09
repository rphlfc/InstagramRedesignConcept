//
//  ContentView.swift
//  Shared
//
//  Created by Raphael Cerqueira on 08/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
