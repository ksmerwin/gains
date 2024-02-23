//
//  ProfileHeaderView.swift
//  gains
//
//  Created by Developer on 1/10/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    @State private var showAddWorkoutSplit = false
    
    
//    @StateObject var viewModel: ProfileViewModel
//    
    
    //    @StateObject var viewModel: AddWorkoutSplitViewModel
    //    @State private var workOutSplit: WorkoutSplit
    
    //    init(user: User) {
    //        self.user = user
    //        self._viewModel = StateObject(wrappedValue: AddWorkoutSplitViewModel(user: user))
    //    }
    
    
    
    var body: some View {
        VStack(spacing: 10){
            //pic and stats
            HStack {
                CircularProfileImageView(user: user, size: .medium)
                    .padding(.leading)
                    .padding(.top)
                
                
                //name and bio
                VStack(alignment: .leading, spacing: 4) {
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical,5)
                        Text(user.username)
                            .font(.footnote)
                        
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    else {
                        Text(user.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    if let level = user.level {
                        Text("\(level.capitalized) Lifter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    else {
                        Text("Novice Lifter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal)
                
                
                
                
            }
            
            HStack(alignment: .center){
                UserStatView(value: 5, title: "Workout Splits")
                UserStatView(value: 5, title: "Followers")
                UserStatView(value: 5, title: "Following")
                
            }
            .padding()
            
            
            
            HStack {
                
                if (!user.isCurrentUser) {
                    NavigationLink {
                        ChatView(user: user)
                        
                    }
                label: {
                    Text("Chat")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 180, height: 45)
                        .foregroundColor(.black)
                        .background(Color("CloudWhite"))
                        .cornerRadius(6)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(lineWidth: 1))
                }
                }
                
                else {
                    
                    
                    //action button
                    Button(action: {
                        showEditProfile.toggle()
                        
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 180, height: 45)
                            .foregroundColor(.black)
                            .background(.white )
                            .cornerRadius(6)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray))
                    })
                }
                
                if (user.isCurrentUser) {
                    Button(action: {showAddWorkoutSplit.toggle()}
                          , label: {
                        Text("Add Workout Split")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 180, height: 45)
                            .foregroundColor(.white)
                            .background(Color("BloodRed"))
                            .cornerRadius(6)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.clear, lineWidth: 1))
                    })
                }
                else {
                    
                    // follow button
                    Button(action: {print("Follow")}
                          , label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 180, height: 45)
                            .foregroundColor(.white)
                            .background(Color("BloodRed"))
                            .cornerRadius(6)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.clear, lineWidth: 1))
                    })
                }
            }
            
            Divider()
        }
        .background(Color("DarkBlack"))
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
        .fullScreenCover(isPresented: $showAddWorkoutSplit, content: {
            AddWorkoutSplitView(user: user)
        })
        
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[1])
}
