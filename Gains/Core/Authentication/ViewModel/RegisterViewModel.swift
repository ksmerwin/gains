//
//  RegisterViewModel.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//

import Foundation


class RegisterViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
        fullname = ""
        
    }
    
    func validateForm() -> Bool {
        if username.isEmpty || !email.contains("@") || email.isEmpty || password.isEmpty || fullname.isEmpty {
          return false
        }
        return true
      }
    
    
}
