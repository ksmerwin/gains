//
//  User.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//

import Foundation
import Firebase
import FirebaseAuth


struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    let level: String?
    // levels will be novice, advanced, expert, Pro
//    var followers: [User]
//    var following: [User]
//    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
    
}


extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: nil, fullname: "Bruce Wayne", bio: "dark knight", email: "batman@gmail.com", level:nil),
        .init(id: NSUUID().uuidString, username: "superman", profileImageUrl: nil, fullname: "Clark Kent", bio: "No to krypto", email: "superman@gmail.com", level: "experienced"),
        .init(id: NSUUID().uuidString, username: "kevmer", profileImageUrl: nil, fullname: "Kevin Merwin", bio: "yolo", email: "primemerwinian@gmail.com", level:nil),
        .init(id: "bJUTUWuVYmUk2LRwRyZLcfWmjdy1", username: "heisenberg", profileImageUrl: "ww", fullname: "Walter White", bio: "Heisenberg", email: "ww@gmail.com", level:nil),
    ]
    
    
}
