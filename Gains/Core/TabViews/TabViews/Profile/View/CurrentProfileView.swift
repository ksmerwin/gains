//
//  CurrentProfileView.swift
//  Gains
//
//  Created by Developer on 1/10/24.
//

import SwiftUI

struct CurrentProfileView: View {
//    @StateObject var viewModel: ProfileViewModel
   
    let user: User
    
    init(user: User) {
        self.user = user
//        self._viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //header
                ProfileHeaderView(user: user)
                
                VStack {
                    
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
                
                
            }
            .background(Color("DarkBlack"))
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    AuthService.shared.signOut()
                                } label: {
                                    Image(systemName: "line.3.horizontal")
                                        .foregroundColor(Color("CloudWhite"))
                                }
            
                            }
                        }
                        .toolbarColorScheme(.dark, for: .navigationBar)
                        .toolbarBackground(Color("DarkBlack"), for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                        .background(Color.black)
        }
    }
}

#Preview {
    CurrentProfileView(user:User.MOCK_USERS[0])
}
