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
    
    
   
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
        fullname = ""
        
    }
    
  
    
}
