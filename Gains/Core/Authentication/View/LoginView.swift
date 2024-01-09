//
//  LoginView.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(systemName: "figure.strengthtraining.traditional")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                
                
                
                Text("Gains")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("Get Gains with friends and followers")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                Button {
                    print("Login")
                } label: {
                    
                    Text("Login")
                        .foregroundColor(.black)
                        .background(Color.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 50)
                        .cornerRadius(6)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(.clear, lineWidth: 1))
                }
                .background(Color.white)
                
                
                NavigationLink{
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                     
                } label: {
                    
                    Text("Join")
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
                .padding(.vertical)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            
        }
    }
    
}

#Preview {
    LoginView()
}
