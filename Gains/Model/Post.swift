//
//  Post.swift
//  Gains
//
//  Created by Developer on 1/8/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    var caption: String
    var likes: Int
    var imageUrl: String?
    var timestamp: Timestamp
    var user : User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "im batman", likes: 12, imageUrl: "batman-2", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "im superman", likes: 20, imageUrl: "superman-2", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "my cap ", likes: 301, imageUrl: "ww-2", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "lets cook", likes: 44, imageUrl: "kevmer", timestamp: Timestamp(), user: User.MOCK_USERS[3])]
    
}
