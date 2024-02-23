//
//  SearchViewModel.swift
//  Gains
//
//  Created by Developer on 2/21/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    
    var filteredUsers: [User] {
        guard !searchText.isEmpty else {return users.filter{ user in
            user.id != AuthService.shared.currentUser?.id
        }}
        return users.filter { user in
            if let fullname = user.fullname {
                (fullname.lowercased().contains(searchText.lowercased()) ||  user.username.lowercased().contains(searchText.lowercased())) &&  user.id != AuthService.shared.currentUser?.id
            }
            else {
                user.username.lowercased().contains(searchText.lowercased()) &&  user.id != AuthService.shared.currentUser?.id
            }
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
    
    
}
