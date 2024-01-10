//
//  LoginViewModel.swift
//  Gains
//
//  Created by Developer on 1/10/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
