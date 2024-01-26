//
//  MiniProfilePostsView.swift
//  Gains
//
//  Created by Developer on 1/19/24.
//

import SwiftUI
import Kingfisher

struct MiniProfilePostsView: View {
    @StateObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }
    
    var body: some View {
        HStack {
            if (viewModel.posts.isEmpty){
                Image(systemName: "figure.highintensity.intervaltraining")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 175, height: 150)
                    .clipped()
                    .foregroundColor(.white)
                Image(systemName: "figure.strengthtraining.functional")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 175, height: 150)
                    .clipped()
                    .foregroundColor(.white)
            }
            
            ForEach(viewModel.posts.prefix(2)) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 150)
                    .clipped()
                    .cornerRadius(15)
                
                if (viewModel.posts.count == 1) {
                    Image(systemName: "figure.strengthtraining.functional")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 175, height: 150)
                        .clipped()
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}

#Preview {
    MiniProfilePostsView(user: User.MOCK_USERS[0])
}
