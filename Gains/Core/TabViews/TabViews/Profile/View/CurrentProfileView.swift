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
                    Button {
                        print("Viw phoys")
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
                    
                    HStack {
                        ForEach(WorkoutSplit.MOCK_WORKOUT_SPLIT.prefix(2)) { split in
                            MiniWorkSplitView(split: split)
//                            Image(split.imageUrl)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 175, height: 150)
//                                .clipped()
                                
                        }
                    }
                    
                    
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
