//
//  PostCellViewModel.swift
//  Gains
//
//  Created by Developer on 2/21/24.
//

import Foundation
import Firebase
import FirebaseFirestore

class PostCellViewModel: ObservableObject {
    @Published var post: Post
    private let service = PostService()

    @Published var newComment: String = ""
    @Published var selectedComment: Comment?
    @Published var comments: [Comment] = []

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
    
//    @MainActor
    func commentOnPost()  {
        service.commentOnPost(post, newComment) {
            guard let currentUser = AuthService.shared.currentUser else { return }
            let timestamp = Timestamp()
            self.post.comments += 1
            let addedComment = Comment(authorId: currentUser.id, postId: self.post.id, commentText: self.newComment, timestamp: timestamp, user: currentUser)
            self.comments.insert(addedComment, at: 0)
            self.newComment = ""
        }
    }
    
    func deleteComment() {
        service.deleteComment(post, selectedComment!) {
            self.post.comments -= 1
            if let selected = self.selectedComment {
                if let index = self.comments.firstIndex(of: selected) {
                    self.comments.remove(at: index)
                }
            self.newComment = ""
            }
        }
        
//        users.remove(atOffsets: offsets)
        }
    
    @MainActor
    func fetchComments() async throws {
        self.comments = try await service.fetchComments(post.id)
        
    }
    
    
    func checkIfUserLikedPost() {
        service.checkIfUserLikedPost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
            
        }
    }
    
    
}
