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
            HStack(spacing: 0) {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                        .padding(.top,5)
                        
                                            
                    VStack {
                        
                    Text(user.username)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("\(post.caption)")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.leading, 18)
                            
                    }
                    
                    Text("6h ago")
                        .font(.footnote)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .padding(.leading, 10)
                        .foregroundColor(.gray)
                    
                    
                }

            }
            .padding(8)
            
            if let image = post.imageUrl
            {
//                KFImage(URL(string: post.imageUrl))

                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:380, height: 350)
                    .cornerRadius(10)
                    
            }
            
            
          
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
                Text("5 comments").fontWeight(.semibold)
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
    FeedCell(post: Post.MOCK_POSTS[1])
        
}
