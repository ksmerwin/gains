//
//  Post.swift
//  Gains
//
//  Created by Developer on 1/8/24.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Post: Identifiable, Hashable, Codable {
   
    
    let id: String
    let ownerUid: String
    var caption: String
    var comments: Int
    var likes: Int
    var imageUrl: String
    var timestamp: Timestamp
    var user : User?
    var didLike: Bool? = false
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "im batman", comments: 3, likes: 12, imageUrl: "arnold", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "im superman", comments: 3, likes: 20, imageUrl: "legs", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: "bJUTUWuVYmUk2LRwRyZLcfWmjdy1", caption: "my cap ", comments: 3, likes: 301, imageUrl: "gains", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: "bJUTUWuVYmUk2LRwRyZLcfWmjdy1", caption: "lets cook", comments: 3, likes: 44, imageUrl: "liftingbanner", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: "bJUTUWuVYmUk2LRwRyZLcfWmjdy1", caption: "lets cook sum more", comments: 3, likes: 33, imageUrl: "liftingbanner", timestamp: Timestamp(), user: User.MOCK_USERS[3])]
    
}
