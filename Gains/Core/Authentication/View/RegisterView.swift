//
//  AddEmailView.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var fullname = ""
    
    var body: some View {
        
        
        VStack() {
            
            Image("liftingweights")
                .resizable()
                .scaledToFit()
                .overlay(
                    VStack {
                        
                        Text("Discover Gains")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                        
                        Text("A safe place for lifters to connect, share, and discover.")
                            .foregroundColor(.white)
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                )
            
            VStack(alignment: .leading) {
            Text("Create an Account")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.vertical)
            
                
                
            TextField("Email", text: $email)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding(16)
                .background(Color(.systemGray3))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.top)
                .foregroundColor(.white)
            
            SecureField("Password", text: $password)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding(16)
                .background(Color(.systemGray3))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.top)
                .foregroundColor(.white)
            
            TextField("Username", text: $username)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding(16)
                .background(Color(.systemGray3))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.top)
                .foregroundColor(.white)
            
            TextField("Full Name", text: $fullname)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding(16)
                .background(Color(.systemGray3))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.top)
                .foregroundColor(.white)
            }
            
          
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            Button {
                print("Sign Up", $email, $password, $username, $fullname)
            } label: {
                
                Text("Sign Up")
                    .foregroundColor(.white)
                    .background(Color.red)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 50)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(.clear, lineWidth: 1))
            }
            .background(Color.red)
            
            Spacer()
                        
            
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
}


#Preview {
    AddEmailView()
}
