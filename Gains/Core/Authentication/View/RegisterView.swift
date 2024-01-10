//
//  RegisterView.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegisterViewModel
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
                Text("Welcome, \(viewModel.username)!")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.vertical)
                
               
            }
            
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            Button {
                Task { try await viewModel.createUser()}
                              
            } label: {
                
                Text("Sign Up")
                    .foregroundColor(.white)
                    .background(Color("BloodRed"))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(.clear, lineWidth: 1))
            }
            .background(Color("BloodRed"))
            
            Spacer()
            
            
         }
        .background(Color.black)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)  {
                Image(systemName: "arrowshape.backward.fill")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
    }
    
}


#Preview {
        RegisterView()
}
