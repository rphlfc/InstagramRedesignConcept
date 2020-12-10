//
//  StoryItemView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 01/12/20.
//

import SwiftUI

struct StoryItemView: View {
    var item: StoryItem
    var size: CGFloat = 60
    
    var body: some View {
        Button(action: {}, label: {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .font(.system(size: 18, weight: .bold))
                .clipShape(Circle())
                .padding(6)
                .background(
                    Circle()
                        .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9868244529, green: 0.5855258107, blue: 0.09304409474, alpha: 1)), Color(#colorLiteral(red: 0.7633709311, green: 0.1634711623, blue: 0.7447224855, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: item.new ? 3 : 0)
                        .foregroundColor(Color(#colorLiteral(red: 0.9389725327, green: 0.9531454444, blue: 0.9702789187, alpha: 1)))
                )
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct StoryItem: Identifiable {
    let id = UUID().uuidString
    var image: String
    var new: Bool
}

let storyItems = [
    StoryItem(image: "profile1", new: false),
    StoryItem(image: "profile2", new: true),
    StoryItem(image: "profile3", new: true),
    StoryItem(image: "profile4", new: false),
    StoryItem(image: "profile5", new: true),
    StoryItem(image: "profile1", new: false),
    StoryItem(image: "profile2", new: true),
    StoryItem(image: "profile3", new: true),
    StoryItem(image: "profile4", new: false),
    StoryItem(image: "profile5", new: true)
]

struct StoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoryItemView(item: storyItems[0])
    }
}
