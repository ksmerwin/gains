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
    var likes: Int
    var imageUrl: String
//    var comments: Int
    var timestamp: Timestamp
    var user : User?
    var didLike: Bool? = false
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "im batman", likes: 12, imageUrl: "arnold", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "im superman", likes: 20, imageUrl: "legs", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: "bJUTUWuVYmUk2LRwRyZLcfWmjdy1", caption: "my cap ", likes: 301, imageUrl: "gains", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: "bJUTUWuVYmUk2LRwRyZLcfWmjdy1", caption: "lets cook", likes: 44, imageUrl: "liftingbanner", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: "bJUTUWuVYmUk2LRwRyZLcfWmjdy1", caption: "lets cook sum more", likes: 33, imageUrl: "liftingbanner", timestamp: Timestamp(), user: User.MOCK_USERS[3])]
    
}
