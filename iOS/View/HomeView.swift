//
//  HomeView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 04/12/20.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: Int
    @Binding var showPostView: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            Color("foreground")
                .ignoresSafeArea(.all, edges: .top)
            
            VStack(spacing: 0) {
                VStack {
                    ZStack {
                        HStack(spacing: 15) {
                            Button(action: {}, label: {
                                Image(systemName: "camera")
                                    .font(.system(size: 28))
                                    .foregroundColor(Color("accent"))
                            })
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "tv")
                                    .font(.system(size: 28))
                                    .foregroundColor(Color(#colorLiteral(red: 0.9868244529, green: 0.5855258107, blue: 0.09304409474, alpha: 1)))
                            })
                            
                            Button(action: {}, label: {
                                Image(systemName: "paperplane")
                                    .font(.system(size: 28))
                                    .foregroundColor(Color(#colorLiteral(red: 0.7633709311, green: 0.1634711623, blue: 0.7447224855, alpha: 1)))
                            })
                        }
                        
                        Image("instagram")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130)
                            .foregroundColor(Color("accent"))
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
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
                            
                            ForEach(storyItems) { item in
                                StoryItemView(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                .background(Color("foreground"))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack(spacing: 15) {
                            ForEach(0 ..< 5) { item in
                                VStack {
                                    HStack {
                                        Image("profile1")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                        
                                        Text("Jennifer_Cole")
                                            .font(.system(size: 19, weight: .bold))
                                        
                                        Spacer()
                                        
                                        Button(action: {}, label: {
                                            Image(systemName: "ellipsis")
                                                .font(.system(size: 21))
                                                .foregroundColor(.gray)
                                        })
                                    }
                                    
                                    Image("post1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: UIScreen.main.bounds.width - 60)
                                        .cornerRadius(30)
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                showPostView.toggle()
                                            }
                                        }
                                        .zIndex(1)
                                        .matchedGeometryEffect(id: "post", in: animation, isSource: false)
                                        
                                    PostSocialView()
                                        .padding(.top)
                                }
                                .padding()
                                .background(Color("foreground"))
                                .cornerRadius(30)
                            }
                        }
                        .padding()
                        
                        Spacer(minLength: 120)
                    }
                    .background(Color("background"))
                }
            }
            
            TabBarView(selectedIndex: $selectedTab)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(selectedTab: .constant(0), showPostView: .constant(false))
//    }
//}
