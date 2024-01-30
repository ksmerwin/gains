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
    let splitId: String
    var name: String
    var exerciseSets: [ExerciseSet]
    var dayOfTheWeek: String
    }

extension Workout {
    static var MOCK_WORKOUT: [Workout] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, splitId: NSUUID().uuidString, name: "", exerciseSets: ExerciseSet.EMPTY_EXERCISE_SET, dayOfTheWeek: "monday"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, splitId: NSUUID().uuidString, name: "Arms", exerciseSets: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "monday"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, splitId: NSUUID().uuidString, name: "Legs", exerciseSets: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "Wednesday"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, splitId: NSUUID().uuidString, name: "Shoulders", exerciseSets: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "Friday"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, splitId: NSUUID().uuidString, name: "Feet", exerciseSets: ExerciseSet.MOCK_EXERCISE_SET, dayOfTheWeek: "Saturday")]
}
