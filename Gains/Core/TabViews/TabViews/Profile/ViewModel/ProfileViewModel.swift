//
//  ProfileViewModel.swift
//  Gains
//
//  Created by Developer on 1/19/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    @Published var workoutSplits = [WorkoutSplit]()
    
    init(user: User) {
        self.user = user
        
        Task {try await fetchUserPosts() }
        Task {try await fetchUserWorkoutSplits() }
    }
    
    @MainActor
    func fetchUserPosts() async throws{
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
    
    @MainActor
    func fetchUserWorkoutSplits() async throws{
        self.workoutSplits = try await WorkoutService.fetchUserSplits(uid: user.id)
        
        for i in 0 ..< workoutSplits.count {
            workoutSplits[i].user = self.user
        }
    }
}
