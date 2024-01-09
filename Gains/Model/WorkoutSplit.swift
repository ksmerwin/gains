//
//  File.swift
//  Gains
//
//  Created by Developer on 1/8/24.
//

import Foundation
import Firebase

struct WorkoutSplit: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    var name: String
    var workouts: [Workout]
    
    
}

extension WorkoutSplit {
    static var MOCK_WORKOUT_SPLIT: [WorkoutSplit] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Arnold", workouts: Workout.MOCK_WORKOUT),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Stallone", workouts: Workout.MOCK_WORKOUT),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Jeff", workouts: Workout.MOCK_WORKOUT),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, name: "Arnold", workouts: Workout.MOCK_WORKOUT)]
}
