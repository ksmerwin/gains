//
//  Comment.swift
//  Gains
//
//  Created by Developer on 2/22/24.
//


import Foundation
import Firebase
import FirebaseFirestore

struct Comment: Identifiable, Codable, Hashable {
    @DocumentID var commentId: String?
    let authorId: String
    let postId: String
    let commentText: String
    let timestamp: Timestamp
    
    var user: User?
        
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
    
    
}

extension Comment {
    static var MOCK_COMMENTS: [Comment] = [
        .init(authorId: "asdasdasdasd", postId: "asdasdasdasd", commentText: "This is neat!", timestamp: Timestamp()),
        .init(authorId: "asdasdasdasd", postId: "asdasdasdasd", commentText: "This is VERYYY neat!", timestamp: Timestamp()),

    ]
    
    
}
