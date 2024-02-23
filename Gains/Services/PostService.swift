//
//  PostService.swift
//  Gains
//
//  Created by Developer on 1/12/24.
//

import Foundation
import Firebase
import FirebaseFirestore

struct PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
            
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
    }
    
    func fetchComments(_ postId: String) async throws -> [Comment] {
        let snapshot = try await Firestore.firestore().collection("comments").document(postId).collection("comments").order(by: "timestamp", descending: true).getDocuments()
        
        var comments = try snapshot.documents.compactMap({ try $0.data(as: Comment.self)})
        
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let authorId = comment.authorId
            let commentUser = try await UserService.fetchUser(withUid: authorId)
            comments[i].user = commentUser
            
        }
        return comments
        
        
    }
    
    func likePost(_ post: Post, completion: @escaping() -> Void) {
        guard let uid =  AuthService.shared.currentUser?.id else { return }
        let postId = post.id
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("posts").document(postId)
            .updateData(["likes": post.likes + 1]) { _ in
                userLikesRef.document(postId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func unlikePost(_ post: Post, completion: @escaping() -> Void) {
        guard let uid =  AuthService.shared.currentUser?.id else { return }
        let postId = post.id
        guard post.likes > 0 else { return }
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("posts").document(postId)
            .updateData(["likes": post.likes - 1]) { _ in
                userLikesRef.document(postId).setData([:]) { _ in
                    userLikesRef.document(postId).delete { _ in
                        completion()
                    }
                }
            }
    }
    
    func checkIfUserLikedPost(_ post: Post, completion: @escaping(Bool) -> Void) {
        guard let uid =  AuthService.shared.currentUser?.id else { return }
        
        Firestore.firestore().collection("users").document(uid)
            .collection("user-likes")
            .document(post.id).getDocument{ snapshot, _ in
                guard let snapshot = snapshot else {return }
                completion(snapshot.exists)
                
            }
    }
    
    
    
    //    func deleteCommentOnPost(post, index)
    func deleteComment(_ post: Post, _ selectedComment: Comment, completion: @escaping() -> Void) {
        let postId = post.id
        let commentsRef = Firestore.firestore().collection("comments").document(postId).collection("comments")
        
        Firestore.firestore().collection("posts").document(postId)
            .updateData(["comments": post.comments - 1]) { _ in
                commentsRef.document(selectedComment.id).delete { _ in
                    completion()
                }
            }
        
        //    }
        //
        
        
        
        //        let newComment = Comment(authorId: currentUid, postId: postId, commentText: commentText, timestamp: Timestamp())
        //        guard let commentData = try? Firestore.Encoder().encode(newComment) else { return }
        
        //        if let doc = Firestore.firestore().collection("comments").document(postId).collection("comments").document(selectedComment.id) {
        //}
    }
    
    
    func commentOnPost(_ post: Post, _ commentText: String, completion: @escaping() -> Void) {
        guard let currentUid = AuthService.shared.currentUser?.id else { return }
        let postId = post.id
        
        Firestore.firestore().collection("posts").document(postId)
            .updateData(["comments": post.comments + 1]) { _ in
                completion()
            }
        let newComment = Comment(authorId: currentUid, postId: postId, commentText: commentText, timestamp: Timestamp())
        guard let commentData = try? Firestore.Encoder().encode(newComment) else { return }
        Firestore.firestore().collection("comments").document(postId).collection("comments").addDocument(data: commentData)
    }
}
