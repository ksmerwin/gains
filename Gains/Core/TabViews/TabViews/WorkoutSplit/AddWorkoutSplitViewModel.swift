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
    let user: User
    
    @Published var workouts = [Workout]()
    @Published var allExercises = [Exercise]()
    @Published var selectedExercises: Set<Exercise> = []
    @Published var searchString: String = ""
    @Published var name = ""
    @Published var categoryFilter: String = "All"
    @Published var description = ""
    
    
    
    
    init(user: User) {
        self.user = user
        Task { try await fetchAllExercises() }
        
    }
    
    
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
    
    @MainActor
    func fetchAllExercises() async throws {
        self.allExercises = try await WorkoutService.fetchAllExercises()
    }
    
    
    func addWorkoutToSplit() {
        let exerciseSets = selectedExercises.map { exercise in
            return ExerciseSet(id: NSUUID().uuidString, sets: 1, reps: 1, exercise: exercise)
        }
        let workout = Workout(id:  NSUUID().uuidString, ownerUid: user.id, name: "", exerciseSets: exerciseSets, dayOfTheWeek: "")
        self.workouts.insert(workout, at: workouts.endIndex)
        selectedExercises = []
    }
    
    
    
    
    
    func uploadWorkoutSplit() async throws {
        let splitRef = Firestore.firestore().collection("workoutSplits").document()
        
        let workoutSplit = WorkoutSplit(id: NSUUID().uuidString, ownerUid: user.id, name: name, description: description, workouts: workouts)
        guard let encodedSplit = try? Firestore.Encoder().encode(workoutSplit) else { return }
        try await splitRef.setData(encodedSplit)
    }
}
