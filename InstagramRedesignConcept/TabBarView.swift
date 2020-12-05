//
//  TabBarView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 04/12/20.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedIndex: Int
    
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

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedIndex: .constant(0))
    }
}
