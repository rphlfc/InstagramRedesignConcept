//
//  StoriesView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 10/12/20.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    ZStack {
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        Circle()
                            .foregroundColor(Color(#colorLiteral(red: 0.2529234886, green: 0.3721377254, blue: 0.9311061502, alpha: 1)).opacity(0.7))
                            .frame(width: 60, height: 60)
                            .padding(8)
                            .background(
                                Circle()
                                    .strokeBorder(Color(#colorLiteral(red: 0.2529234886, green: 0.3721377254, blue: 0.9311061502, alpha: 1)), lineWidth: 3)
                            )
                        
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        
                    }
                    .padding(3)
                    .clipShape(Circle())
                })
                .buttonStyle(PlainButtonStyle())
                
                ForEach(storyItems) { item in
                    StoryItemView(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
