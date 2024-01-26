//
//  UploadPostView.swift
//  Gains
//
//  Created by Developer on 1/18/24.
//


import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {

        VStack {
            
            //action toolbar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                }
                label: {
                Text("Cancel")
                        .foregroundColor(Color("BloodRed"))
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("BloodRed"))
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }                }
                label: {
                    Text("Upload")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("BloodRed"))
                }
                
            }
            .padding(.horizontal)
            .background(Color("DarkBlack"))
            
            
            // post image and caption
            HStack {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .clipped()
                }
                
                TextField("", text: $caption, prompt: Text("Enter your caption").foregroundColor(.gray), axis: .vertical)
                    
                    .foregroundColor(.white)
                
            }
            .padding()
            
            Spacer()
            
        }
        .onAppear{
            imagePickerPresented.toggle()
            
        }
        
        .background(Color("DarkBlack"))
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
        
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView( tabIndex: .constant(1))
}
