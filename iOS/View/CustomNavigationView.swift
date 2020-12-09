//
//  CustomNavigationView.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 06/12/20.
//

import SwiftUI

struct CustomNavigationView: View {
    @Binding var showPostView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    showPostView.toggle()
                }
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 19))
                    .foregroundColor(Color("accent"))
            })
        
            Spacer()
            
            Text("Kate Lingard")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(Color("accent"))
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 19))
                    .foregroundColor(Color("accent"))
            })
        }
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(showPostView: .constant(false))
    }
}
