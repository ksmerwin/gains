//
//  WorkoutService.swift
//  Gains
//
//  Created by Developer on 1/12/24.
//

import Foundation
import Firebase
import FirebaseFirestore


struct WorkoutService {
    
    private static let exerciseCollection = Firestore.firestore().collection("exercises")

    
    static func fetchAllExercises() async throws -> [Exercise] {
        let snapshot = try await Firestore.firestore().collection("exercises").getDocuments()
        
        
        //$0 is each element in the array (of the document)
        
        return snapshot.documents.compactMap({try? $0.data(as: Exercise.self)})
        
    }
    
//    static func fetchUser(withUid uId: String) async throws -> User {
//        let snapshot = try await Firestore.firestore().collection("users").document(uId).getDocument()
//        return try snapshot.data(as: User.self)
//    }
}
