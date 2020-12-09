//
//  ProfileView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 04/12/20.
//

import SwiftUI

struct ProfileView: View {
    let gridItemLayout = [
        GridItem(.flexible(minimum: 40), spacing: 15),
        GridItem(.flexible(minimum: 40), spacing: 15),
    ]
    
    let images = ["post2", "post3", "post4", "post5"]
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color("background")
            
            VStack(spacing: 0) {
                VStack {
                    CustomNavigationView(showPostView: .constant(true))
                        .padding(.horizontal)
                        .padding(.top, 44)
                    
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
                    .frame(height: 70)
                    
                    HStack {
                        Button(action: {}, label: {
                            Text("Follow")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        })
                        .frame(width: 130, height: 44)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9803691506, green: 0.6443859935, blue: 0.2819789648, alpha: 1)), Color(#colorLiteral(red: 0.89657408, green: 0.2502866685, blue: 0.409398675, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .cornerRadius(15)
                        
                        Button(action: {}, label: {
                            Image(systemName: "paperplane")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.black)
                        })
                        .frame(width: 50, height: 44)
                        .background(Color(#colorLiteral(red: 0.9251086116, green: 0.9291313291, blue: 0.9552046657, alpha: 1)))
                        .cornerRadius(15)
                    }
                    .padding(.bottom, 30)
                }
                .background(Color("foreground"))
                .cornerRadius(40)
                .ignoresSafeArea(.container, edges: .top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridItemLayout, spacing: 15, content: {
                        ForEach(images, id: \.self) { item in
                            Image(item)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .aspectRatio(1, contentMode: .fill)
                                .cornerRadius(30)
                        }
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                }
                .offset(y: -25)
                
                Spacer()
            }
            
            TabBarView(selectedIndex: $selectedTab)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(selectedTab: .constant(3))
    }
}
