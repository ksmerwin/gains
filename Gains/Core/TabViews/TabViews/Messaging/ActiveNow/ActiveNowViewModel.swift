//
//  ActiveNowViewModel.swift
//  Gains
//
//  Created by Developer on 2/7/24.
//

import Foundation

class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
