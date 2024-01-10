//
//  CurrentProfileView.swift
//  Gains
//
//  Created by Developer on 1/10/24.
//

import SwiftUI

struct CurrentProfileView: View {
    
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //header
                //header
                ProfileHeaderView(user: user)
                
            }
            .background(Color("DarkBlack"))
//            .navigationTitle("Profile")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar{
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        AuthService.shared.signOut()
//                    } label: {
//                        Image(systemName: "line.3.horizontal")
//                            .foregroundColor(.black)
//                    }
//                    
//                }
//            }
        }
        .background(Color("DarkBlack"))
    }
}

#Preview {
    CurrentProfileView(user:User.MOCK_USERS[0])
}
