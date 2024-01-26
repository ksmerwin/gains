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
    var category: String
}

extension Exercise {
    static var MOCK_EXERCISE: [Exercise] = [
        .init(id: NSUUID().uuidString, name: "Exercise 1", category: "chest"),
        .init(id: NSUUID().uuidString, name: "Exercise 2", category: "chest"),
        .init(id: NSUUID().uuidString, name: "Exercise 3", category: "arms"),
        .init(id: NSUUID().uuidString, name: "Exercise 4", category: "arms")]
}
