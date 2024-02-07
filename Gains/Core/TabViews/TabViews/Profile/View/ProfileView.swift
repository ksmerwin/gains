//
//  ProfileView.swift
//  Gains
//
//  Created by Developer on 1/10/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
//        NavigationStack {
            
            ScrollView {
                //header
                
                VStack {
                    ProfileHeaderView(user: user)
                    
                    // workout photos
                    NavigationLink {
                        ProfilePostsView(user: user)
                        
                    }
                label: {
                    Text("Workout Photos")
                        .foregroundColor(.white)
                        .padding()
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                }
                    
                    MiniProfilePostsView(user: user)
                    
                    NavigationLink {
                        WorkoutSplitsView(user: user)
                        
                    }
                label: {
                    Text("Workout Splits")
                        .foregroundColor(.white)
                        .padding()
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                }
                    
                    MiniWorkSplitView(user: user)
                    
                    
                    
                }
                .background(Color("DarkBlack"))
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color("DarkBlack"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                
            }
            .background(Color("DarkBlack"))
        }
//    }
}

#Preview {
    ProfileView(user:User.MOCK_USERS[0])
}
