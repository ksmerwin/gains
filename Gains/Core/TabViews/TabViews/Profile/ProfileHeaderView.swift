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
                UserStatView(value: 3, title: "Workout Splits")
                UserStatView(value: 12, title: "Followers")
                UserStatView(value: 15, title: "Following")
                
            }
            .padding()
            
            
            
            HStack {
                
                //action button
                Button(action: {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    }
                    else {
                        print("Chat")
                    }
                    
                }, label: {
                    Text(user.isCurrentUser ? "Edit Profile" : "Chat")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 180, height: 45)
                        .foregroundColor(user.isCurrentUser ? .black : .black)
                        .background(user.isCurrentUser ? .white : Color("CloudWhite"))
                        .cornerRadius(6)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1))
                })
                
                //action button
                Button(action: {
                    if user.isCurrentUser {
                        print("add workout split")
                    }
                    else {
                        print("follow")
                    }
                    
                }, label: {
                    Text(user.isCurrentUser ? "Add Workout Split" : "Follow")
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
            
            Divider()
        }
        .background(Color("DarkBlack"))
        //        .fullScreenCover(isPresented: $showEditProfile, content: {
        //            EditProfileView(user: user)
        //        })
        
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[1])
}
