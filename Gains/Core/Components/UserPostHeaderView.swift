//
//  UserPostHeaderView.swift
//  Gains
//
//  Created by Developer on 1/26/24.
//

import SwiftUI

struct UserPostHeaderView: View {
    let post: Post
    
    var body: some View {
    
        
        
        
        VStack {
            if let user = post.user {
                CircularProfileImageView(user: user, size: .xSmall)
                    .padding(.top,10)
                Text(user.username)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    UserPostHeaderView(post: Post.MOCK_POSTS[0])
        .background(Color.black)
}
