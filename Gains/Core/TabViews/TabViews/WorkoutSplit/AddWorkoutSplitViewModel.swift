//
//  AddWorkoutSplitViewModel.swift
//  Gains
//
//  Created by Developer on 1/26/24.
//


import Foundation
import PhotosUI
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

@MainActor
class AddWorkoutSplitViewModel: ObservableObject {
    @Published var split: WorkoutSplit
    
    @Published var allExercises = [Exercise]()
    
    
    @Published  var searchString: String = ""
    @Published  var categoryFilter: String = "All"
    
    @Published var selectedExercises: Set<Exercise> = []
    
    
    
    var filteredExercises: [Exercise] {
        guard !searchString.isEmpty else {return allExercises}
        return allExercises.filter { exercise in
            exercise.name.lowercased().contains(searchString.lowercased())
        }
    }
    
    var exercisesByCategory: [Exercise] {
        guard categoryFilter != "All" else {return filteredExercises}
        return filteredExercises.filter { exercise in
            exercise.category.lowercased() == categoryFilter.lowercased()
        }
    }
    
    
    
    

    
//    @Published var split: WorkoutSplit = emptySplit {
//        
//    }
//    
    
    @Published var description = ""
    
    
    
    init(split: WorkoutSplit) {
        self.split = split
        
        if let description = split.description {
            self.description = description
        }
        
        Task { try await fetchAllExercises() }
        
    }
    
    
    @MainActor
    func fetchAllExercises() async throws {
        self.allExercises = try await WorkoutService.fetchAllExercises()
    }
    
    var emptySplit: WorkoutSplit {
        return WorkoutSplit.MOCK_WORKOUT_SPLIT[0]
    }
    
    
    func addWorkoutToSplit() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        print(self.split.workouts)
        let exerciseSets = selectedExercises.map { exercise in
            return ExerciseSet(id: NSUUID().uuidString, sets: 0, reps: 0, exercise: exercise)
           }

        let workout = Workout(id:  NSUUID().uuidString, ownerUid: uid, splitId: self.split.id, name: "", exerciseSets: exerciseSets, dayOfTheWeek: "")
        self.split.workouts.insert(workout, at: self.split.workouts.endIndex)
        selectedExercises = []
    }
    
    
    func uploadWorkoutSplit() async throws {
        let splitRef = Firestore.firestore().collection("workoutSplits").document()
        split.description = description
        guard let encodedSplit = try? Firestore.Encoder().encode(split) else { return }
        try await splitRef.setData(encodedSplit)
    }
    
    
}
