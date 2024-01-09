//
//  Workout.swift
//  Gains
//
//  Created by Developer on 1/8/24.
//

import Foundation
import Firebase

struct Workout: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    var name: String
    var exercises: [Exercise]
    }

extension Workout {
    static var MOCK_WORKOUT: [Workout] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Arms", exercises: Exercise.MOCK_EXERCISE),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Legs", exercises: Exercise.MOCK_EXERCISE),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Shoulders", exercises: Exercise.MOCK_EXERCISE),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Feet", exercises: Exercise.MOCK_EXERCISE)]
}
