//
//  PostSocialView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 06/12/20.
//

import SwiftUI

struct PostSocialView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color(#colorLiteral(red: 0.9346720576, green: 0.3965729177, blue: 0.2802894711, alpha: 1)))
                    
                    Text("1, 242")
                        .font(.system(size: 23, weight: .medium))
                        .foregroundColor(Color("accent"))
                }
            })
            
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 26))
                        .foregroundColor(Color("accent"))
                    
                    Text("24")
                        .font(.system(size: 23, weight: .medium))
                        .foregroundColor(Color("accent"))
                }
            })
            .padding(.leading, 20)
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 26))
                    .foregroundColor(Color("accent"))
            })
        }
    }
}

struct PostSocialView_Previews: PreviewProvider {
    static var previews: some View {
        PostSocialView()
    }
}
