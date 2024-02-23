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

}
