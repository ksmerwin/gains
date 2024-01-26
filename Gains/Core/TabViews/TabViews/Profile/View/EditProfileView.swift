//
//  EditProfileView.swift
//  Gains
//
//  Created by Developer on 1/18/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    
    var body: some View {
        VStack {
            //toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(Color("BloodRed"))
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button {
                        Task {try await viewModel.updateUserData()}
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("BloodRed"))
                    }
                }
                .padding(.horizontal)
                Divider()
            }
            //edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage){
                
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    } else {
                        CircularProfileImageView(user: viewModel.user,size: .large)
                    }
                    
                    
                    Text("Edit Profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("BloodRed"))
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            //edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio",placeholder: "Enter your bio", text:$viewModel.bio)
                
                EditProfileRowView(title: "Level",placeholder: "Enter your lifting Level", text:$viewModel.level)
                
            }
            
            Spacer()
            
        }
        .background(Color("DarkBlack"))
    }
}


struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    let levels = ["Novice", "Intermediate", "Advanced", "Professional"]
    
    
    var body: some View {
        if (title != "Level") {
            HStack {
                Text(title)
                    .padding(.leading,8)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundColor(.white)
                
                VStack{
                    
                    
                    
                    TextField(placeholder, text: $text)
                        .foregroundColor(.white)
                    
                    
                    
                    Divider()
                        .background(Color.white)
                }
            }
            .font(.subheadline)
            .frame(height: 36)
        }
        else {
            
            Text(title)
                .padding(.top, 25)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                .foregroundColor(.white)
                .fontWeight(.semibold)
            
            Picker(placeholder, selection: $text) {
                ForEach(levels, id: \.self) {
                    Text($0)
                }
            }
            .background(Color("CloudWhite"))
            .cornerRadius(5)
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
