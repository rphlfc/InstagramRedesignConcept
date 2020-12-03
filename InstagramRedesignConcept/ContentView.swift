//
//  ContentView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 01/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView: View {
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
                                        .scaledToFit()
                                        .cornerRadius(30)
                                    
                                    HStack {
                                        Button(action: {}, label: {
                                            Image(systemName: "heart.fill")
                                                .font(.system(size: 26))
                                                .foregroundColor(Color(#colorLiteral(red: 0.9346720576, green: 0.3965729177, blue: 0.2802894711, alpha: 1)))
                                        })
                                        
                                        Text("1, 242")
                                            .font(.system(size: 23, weight: .semibold))
                                            .foregroundColor(Color("accent"))
                                        
                                        Button(action: {}, label: {
                                            Image(systemName: "bubble.left")
                                                .font(.system(size: 26))
                                                .foregroundColor(Color("accent"))
                                        })
                                        .padding(.leading, 20)
                                        
                                        Text("24")
                                            .font(.system(size: 23, weight: .semibold))
                                            .foregroundColor(Color("accent"))
                                        
                                        Spacer()
                                        
                                        Button(action: {}, label: {
                                            Image(systemName: "bookmark")
                                                .font(.system(size: 26))
                                                .foregroundColor(Color("accent"))
                                        })
                                    }
                                    .padding(.top)
                                }
                                .padding()
                                .background(Color("foreground"))
                                .cornerRadius(30)
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                    .background(Color("background"))
                }
            }
            
            TabBarView()
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

struct TabBarView: View {
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack(alignment: .bottom) {
                TabBarShape()
                    .foregroundColor(Color("foreground"))
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .shadow(color: Color.black.opacity(0.1), radius: 7, x: 0.0, y: 0.0)
                
                HStack {
                    Button(action: {
                        selectedIndex = 0
                    }, label: {
                        Image(systemName: selectedIndex == 0 ? "house.fill" : "house")
                            .font(.system(size: 28))
                            .foregroundColor(Color("accent"))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        selectedIndex = 1
                    }, label: {
                        Image(systemName: selectedIndex == 1 ? "magnifyingglass" : "magnifyingglass")
                            .font(.system(size: 28))
                            .foregroundColor(Color("accent"))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 32, weight: .light))
                            .foregroundColor(.white)
                        
                    })
                    .frame(width: 65, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9803691506, green: 0.6443859935, blue: 0.2819789648, alpha: 1)), Color(#colorLiteral(red: 0.8927131891, green: 0.2405647933, blue: 0.4056327939, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .clipShape(Circle())
                    .offset(y: -50)
                    
                    Spacer()
                    
                    Button(action: {
                        selectedIndex = 2
                    }, label: {
                        Image(systemName: selectedIndex == 2 ? "heart.fill" : "heart")
                            .font(.system(size: 28))
                            .foregroundColor(Color("accent"))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        selectedIndex = 3
                    }, label: {
                        Image(systemName: selectedIndex == 3 ? "person.fill" : "person")
                            .font(.system(size: 28))
                            .foregroundColor(Color("accent"))
                    })
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
