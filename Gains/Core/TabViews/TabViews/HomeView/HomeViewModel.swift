//
//  HomeViewModel.swift
//  Gains
//
//  Created by Developer on 1/19/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task {try await fetchPosts()}
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }

}
