//
//  PostView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 06/12/20.
//

import SwiftUI

struct PostView: View {
    @State var comment = ""
    @Binding var showPostView: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("foreground")
                .ignoresSafeArea(.all, edges: .vertical)
            
            VStack(alignment: .leading) {
                CustomNavigationView(showPostView: $showPostView)
                    .zIndex(2)
                    
                Image("post1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.width - 60)
                    .cornerRadius(30)
                    .padding(.top)
                    .matchedGeometryEffect(id: "post", in: animation)
                    .zIndex(1)
                    
                PostSocialView()
                    .padding(.top)
                
                Text("Tiffany Jones: Freedom #holidays #greece #sea #travel #sunshine")
                    .padding(.top)
                
                Text("12 mins ago")
                    .padding(.top)
                    .foregroundColor(.gray)
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0 ..< 5) { item in
                        CommentView()
                        .padding(.vertical)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .background(Color("foreground"))
            
            HStack {
                RoundedRectangle(cornerRadius: 60)
                    .frame(height: 60)
                    .foregroundColor(Color("background"))
                    .overlay(
                        HStack {
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .padding(.horizontal)
                            
                            TextField("Enter your comment", text: $comment)
                        }
                    )
                    .padding(.top)
            }
            .background(Color("foreground"))
            .padding(.horizontal)
        }
    }
}

struct CommentView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                Text("@YourMartin")
                    .foregroundColor(.gray)
                
                Text("Amazing view! Regards from the Maldives! 🌴🍹")
                    .foregroundColor(Color("accent"))
            }
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            PostView(showPostView: .constant(false))
//                .preferredColorScheme(.light)
//
//            PostView(showPostView: .constant(false))
//                .preferredColorScheme(.dark)
//        }
//    }
//}
