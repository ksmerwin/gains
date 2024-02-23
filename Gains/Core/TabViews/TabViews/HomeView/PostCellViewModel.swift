//
//  PostCellViewModel.swift
//  Gains
//
//  Created by Developer on 2/21/24.
//

import Foundation

class PostCellViewModel: ObservableObject {
    @Published var post: Post
    private let service = PostService()
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    @MainActor
    func likePost()  {
        service.likePost(post) {
            self.post.didLike = true
            self.post.likes += 1
        }
    }
    
    @MainActor
    func unlikePost()  {
        service.unlikePost(post) {
            self.post.didLike = false
            self.post.likes -= 1
        }
    }
    
    func checkIfUserLikedPost() {
        service.checkIfUserLikedPost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
            
        }
    }
    
    
}
