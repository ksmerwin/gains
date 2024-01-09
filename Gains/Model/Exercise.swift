//
//  Exercise.swift
//  Gains
//
//  Created by Developer on 1/8/24.
//

import Foundation
import Firebase

struct Exercise: Identifiable, Hashable, Codable {
    let id: String
    var name: String
    var sets: Int
    var reps: Int
    var type: String
}

extension Exercise {
    static var MOCK_EXERCISE: [Exercise] = [
        .init(id: NSUUID().uuidString, name: "Exercise 1", sets: 3, reps: 8, type: "chest"),
        .init(id: NSUUID().uuidString, name: "Exercise 2", sets: 3, reps: 8, type: "chest"),
        .init(id: NSUUID().uuidString, name: "Exercise 3", sets: 3, reps: 8, type: "triceps"),
        .init(id: NSUUID().uuidString, name: "Exercise 4", sets: 3, reps: 8, type: "triceps")]
}
