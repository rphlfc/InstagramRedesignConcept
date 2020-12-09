//
//  HomeView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 08/12/20.
//

import SwiftUI

struct HomeView: View {
    var window = NSScreen.main?.visibleFrame
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image("instagram")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(Color("accent"))
                    
                    Spacer()
                }
                .padding(.top, 35)
                .padding(.horizontal)
                
                StoryItemView(item: StoryItem(image: "profile", new: true))
                    .padding()
                
                Text("Kate Lingard")
                    .font(.system(size: 29, weight: .semibold))
                    .foregroundColor(Color("accent"))
                
                Text("🤑 I love my life 🥰")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color("accent"))
                    .padding()
                
                HStack(spacing: 20) {
                    VStack(spacing: 4) {
                        Text("46")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color("accent"))
                        
                        Text("Posts")
                            .font(.system(size: 15))
                            .foregroundColor(Color.gray)
                    }
                    
                    Divider()
                        .frame(height: 40)
                    
                    VStack(spacing: 4) {
                        Text("2,823")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color("accent"))
                        
                        Text("Followers")
                            .font(.system(size: 15))
                            .foregroundColor(Color.gray)
                    }
                    
                    Divider()
                        .frame(height: 40)
                    
                    VStack(spacing: 4) {
                        Text("526")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color("accent"))
                        
                        Text("Following")
                            .font(.system(size: 15))
                            .foregroundColor(Color.gray)
                    }
                }
                
                MenuOptionsView()
                    .padding(.top, 20)
                
                Spacer()
            }
            .frame(width: 280)
            .background(Color("background"))
            
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: window!.width / 1.2, height: window!.height - 40)
        .background(Color("foreground"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct MenuOptionsView: View {
    let options = [
        MenuOption(image: "square.grid.2x2", title: "Feed"),
        MenuOption(image: "magnifyingglass", title: "Explore"),
        MenuOption(image: "bell", title: "Notifications", count: 2),
        MenuOption(image: "envelope", title: "Messages", count: 8),
        MenuOption(image: "paperplane", title: "Direct"),
        MenuOption(image: "chart.bar", title: "Stats"),
        MenuOption(image: "gearshape", title: "Settings"),
        MenuOption(image: "arrow.right", title: "Logout"),
    ]
    
    @State var selectedIndex = 0
    @Namespace var animation
    
    var body: some View {
        ForEach(0 ..< options.count) { index in
            Button(action: {
                withAnimation(.spring()) {
                    selectedIndex = index
                }
            }, label: {
                HStack {
                    Image(systemName: options[index].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18)
                        .foregroundColor(selectedIndex == index ? .pink : .black)
                    
                    Text(options[index].title)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(selectedIndex == index ? .pink : .black)
                        .padding(.leading)
                    
//                    if options[index].count > 0 {
//                        Text(options[index].count)
//                            .font(.system(size: 15))
//                            .foregroundColor(.gray)
//                    }
                    
                    Spacer()
                    
                    ZStack {
                        Capsule()
                            .fill(Color.clear)
                            .frame(width: 3, height: 25)
                        
                        if selectedIndex == index {
                            Capsule()
                                .fill(Color.pink)
                                .frame(width: 3, height: 25)
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                    }
                }
                .padding(.leading)
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct MenuOption: Identifiable {
    let id = UUID().uuidString
    var image: String
    var title: String
    var count = 0
}
