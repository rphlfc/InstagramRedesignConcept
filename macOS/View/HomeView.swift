//
//  HomeView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 08/12/20.
//

import SwiftUI

struct HomeView: View {
    var window = NSScreen.main?.visibleFrame
    @State var search = ""
    @Namespace var animation: Namespace.ID
    @State var selectedIndex = 0
    
    var body: some View {
        HStack {
            SideMenuView()
            
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("Search", text: $search)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .frame(width: 200)
                    .cornerRadius(5)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "bell")
                                .font(.system(size: 21))
                                
                            Circle()
                                .frame(width: 3, height: 3)
                                .foregroundColor(Color(#colorLiteral(red: 0.8857493997, green: 0.2029119432, blue: 0.4205158353, alpha: 1)))
                                .offset(y: -4)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}, label: {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "envelope")
                                .font(.system(size: 21))
                                
                            Circle()
                                .frame(width: 3, height: 3)
                                .foregroundColor(Color(#colorLiteral(red: 0.8857493997, green: 0.2029119432, blue: 0.4205158353, alpha: 1)))
                                .offset(x: 8, y: -4)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Circle()
                                .fill(Color.white.opacity(0.3))
                                .overlay(
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                )
                                .frame(width: 20, height: 20)
                            
                            Text("Add photo")
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8889061809, green: 0.2303937674, blue: 0.41062814, alpha: 1)), Color(#colorLiteral(red: 0.9780260921, green: 0.6275852323, blue: 0.2913298011, alpha: 1))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .cornerRadius(10)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                
                HStack {
                    Text("Stories")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(.black)
                                .padding(12)
                                .background(Circle().stroke(Color.gray.opacity(0.7), lineWidth: 1))
                            
                            Text("Watch all")
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.top)
                
                StoriesView()
                
                HStack {
                    Text("Feed")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            selectedIndex = 0
                        }
                    }, label: {
                        VStack {
                            Text("Latest")
                                .fontWeight(.semibold)
                            
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 3, height: 3)
                                
                                if selectedIndex == 0 {
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 3, height: 3)
                                        .matchedGeometryEffect(id: "tab", in: animation)
                                }
                            }
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        withAnimation {
                            selectedIndex = 1
                        }
                    }, label: {
                        VStack {
                            Text("Popular")
                                .fontWeight(.semibold)
                            
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 3, height: 3)
                                
                                if selectedIndex == 1 {
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 3, height: 3)
                                        .matchedGeometryEffect(id: "tab", in: animation)
                                }
                            }
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                
                GeometryReader { reader in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15, content: {
                            ForEach(0 ..< 15) { item in
                                VStack {
                                    Image("post1")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(20)
                                    
                                    HStack {
                                        StoryItemView(item: StoryItem(image: "profile", new: true), size: 30)
                                            .frame(width: 20, height: 20)
                                            .padding(.horizontal)
                                           
                                        Text("Dom.Hill")
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
                                        Button(action: {}, label: {
                                            HStack(spacing: 0) {
                                                Image(systemName: "heart")
                                                
                                                Text("5.2k")
                                            }
                                        })
                                        .buttonStyle(PlainButtonStyle())
                                        
                                        Button(action: {}, label: {
                                            HStack(spacing: 0) {
                                                Image(systemName: "message")
                                                
                                                Text("38")
                                            }
                                        })
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                    .padding(.vertical, 8)
                                }
                                .padding(.bottom, 4)
                            }
                        })
                    }
                }
                .padding(.bottom, 30)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 30)
            .padding(.top, 35)
            .background(Color("foreground"))
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: window!.width / 1.2, height: window!.height - 50)
        .background(Color("foreground"))
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set {}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
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

struct SideMenuView: View {
    var body: some View {
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
    }
}
