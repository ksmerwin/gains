//
//  ExerciseSet.swift
//  Gains
//
//  Created by Developer on 1/12/24.
//

import Foundation


struct ExerciseSet: Identifiable, Hashable, Codable {
    let id: String
    var sets: Int
    var reps: Int
    var exercise: Exercise
}

extension ExerciseSet {
    static var MOCK_EXERCISE_SET: [ExerciseSet] = [
        .init(id: NSUUID().uuidString, sets: 1, reps: 8, exercise: Exercise.MOCK_EXERCISE[0]),
        .init(id: NSUUID().uuidString, sets: 2, reps: 8, exercise: Exercise.MOCK_EXERCISE[0]),
        .init(id: NSUUID().uuidString, sets: 3, reps: 8, exercise: Exercise.MOCK_EXERCISE[0]),
        .init(id: NSUUID().uuidString, sets: 4, reps: 8, exercise: Exercise.MOCK_EXERCISE[0])]
}
