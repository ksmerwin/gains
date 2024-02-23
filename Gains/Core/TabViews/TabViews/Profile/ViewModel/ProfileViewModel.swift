//
//  ProfileViewModel.swift
//  Gains
//
//  Created by Developer on 1/19/24.
//

import Foundation
import FirebaseFirestore


class ProfileViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    @Published var workoutSplits = [WorkoutSplit]()
    
//    @Published var following = 0
//    @Published var followers = 0
//    
//    @Published var followCheck = false
//    
    init(user: User) {
        self.user = user
        
        Task {try await fetchUserPosts() }
        Task {try await fetchUserWorkoutSplits() }
//        Task {try await followState(userId: user.id) }
//        Task {try await fetchFollowCounts(userId: user.id)}
    }
    
//    @MainActor
//    func followState(userId: String) async throws {
//        self.followCheck = FollowService.getFollowingCheck(userId: userId)
//    }
    
//    @MainActor
//    func fetchFollowCounts(userId: String) async throws {
//        self.followers = try await FollowService.fetchFollowersByUserId(uId: userId).count
//        self.following = try await FollowService.fetchFollowingByUserId(uId: userId).count
//        
//    }
    
    
//
//    @MainActor
//    func fetchUserFollowers() async throws{
//        self.posts = try await PostService.fetchUserPosts(uid: user.id)
//        
//        for i in 0 ..< posts.count {
//            posts[i].user = self.user
//        }
//    }
    
    
//    
//    @MainActor
//    func unfollow() async throws{
//       print("unfollow")
//    }
//    
//    @MainActor
//    func follow() async throws{
//       print("follow")
//    }
//    
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
