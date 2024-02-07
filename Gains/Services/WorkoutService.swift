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
    
    private static let splitCollection = Firestore.firestore().collection("workoutSplits")
    
    static func fetchAllExercises() async throws -> [Exercise] {
        let snapshot = try await exerciseCollection.getDocuments()
        
        
        //$0 is each element in the array (of the document)
        
        return snapshot.documents.compactMap({try? $0.data(as: Exercise.self)})
        
    }
    
    static func fetchUserSplits(uid: String) async throws -> [WorkoutSplit] {
        let snapshot = try await splitCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: WorkoutSplit.self)})
    }
    
    
//    static func fetchUser(withUid uId: String) async throws -> User {
//        let snapshot = try await Firestore.firestore().collection("users").document(uId).getDocument()
//        return try snapshot.data(as: User.self)
//    }
}
