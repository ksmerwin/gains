//
//  InboxView.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//

import SwiftUI

struct InboxView: View {
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        return AuthService().currentUser
    }
    
    var body: some View {
        List {
            
            ForEach(viewModel.recentMessages) { message in
                NavigationLink {
                    if let user = message.user {
                        ChatView(user: user)
                    }
                }
            label: {
                InboxRowView(message: message)
                
            }
            }
            .listRowBackground(Color("DarkBlack"))
        }
        .listStyle(PlainListStyle())
        .navigationDestination(for: Message.self, destination: { message in
            if let user = message.user {
                ChatView(user: user)
            }
        })
        .navigationTitle("Messages")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color("DarkBlack"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        .background(.darkBlack)
        
    }
}

#Preview {
    InboxView()
}
