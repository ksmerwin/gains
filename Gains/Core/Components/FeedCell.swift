//
//  FeedCell.swift
//  Gains
//
//  Created by Developer on 1/9/24.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            // image + username + caption + time
//            HStack(spacing: 0) {
//                created the component UserPostHeaderView to be used with this
//                component so that it could be a link to user's profile
                
//            }
//            .padding(5)
            
            Text("\(post.caption)")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.top)
                
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width:380, height: 350)
                .cornerRadius(10)
            
            
            
            
            HStack {
                
                // likes label
                Text("\(post.likes) likes")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1)
                
                
                Spacer()
                //                will be comment count
                VStack{
                   
                    
                Text("5 comments").fontWeight(.semibold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    
                }
            }
            .font(.footnote)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
            
            
            
        }
        .background(Color.black)
    }
    
    
}


#Preview {
    FeedCell(post: Post.MOCK_POSTS[4])
    
}
