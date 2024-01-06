//
//  ContentView.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegisterViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
//                LoginView().environmentObject(registrationViewModel)
            } else {
//            if let currentUser = viewModel.currentUser{
                Text("Logged in")
            }
        }
    }
}

#Preview {
    ContentView()
}
