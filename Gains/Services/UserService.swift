//
//  UserService.swift
//  Gains
//
//  Created by Developer on 1/10/24.
//

import Foundation
import Firebase


struct UserService {
    
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        
        //$0 is each element in the array (of the document)
        
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
        
    }
    
    static func fetchUser(withUid uId: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uId).getDocument()
        return try snapshot.data(as: User.self)
    }
}
