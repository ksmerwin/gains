//
//  AddEmailView.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegisterViewModel
    
    
    var body: some View {
        
        
        
        VStack {
            
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
                Text("Add an Email")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.vertical)
                
                
                
                TextField("", text: $viewModel.email, prompt: Text("Email").foregroundColor(.gray))
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .modifier(TextFieldModifer())
                
            }
            
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            NavigationLink {
                AddUsernameView()
                    .navigationBarBackButtonHidden()
            } label: {
                
                Text("Next")
                    .foregroundColor(.white)
                    .background(viewModel.email.isEmpty ? Color.clear : Color("BloodRed"))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(.clear, lineWidth: 1))
            }
            .background(viewModel.email.isEmpty ? Color.accentColor : Color("BloodRed"))
            .disabled(viewModel.email.isEmpty || !viewModel.email.contains("@"))
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
    ZStack{
        AddEmailView()
    }
}
