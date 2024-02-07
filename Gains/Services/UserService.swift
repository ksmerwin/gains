//
//  UserService.swift
//  Gains
//
//  Created by Developer on 1/10/24.
//

import Foundation
import Firebase
import FirebaseFirestore


struct UserService {
    
    
    static func fetchAllUsers(limit: Int? = nil) async throws -> [User] {
        let query = Firestore.firestore().collection("users")
        if let limit {
            query.limit(to: limit)
        }
        
        let snapshot = try await query.getDocuments()
        
        //$0 is each element in the array (of the document)
        
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
        
    }
    
    static func fetchUser(withUid uId: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uId).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    
    // fetch user for snapshot listeners -- cant use async for snapshot
    static func fetchUserSnapshot(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument {snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
}
