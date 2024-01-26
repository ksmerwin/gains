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
    var exercises: [ExerciseSet]
    var dayOfTheWeek: String
    }

extension Workout {
    static var MOCK_WORKOUT: [Workout] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Arms", exercises: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "monday"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Legs", exercises: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "Wednesday"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Shoulders", exercises: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "Friday"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Feet", exercises: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "Saturday")]
}
