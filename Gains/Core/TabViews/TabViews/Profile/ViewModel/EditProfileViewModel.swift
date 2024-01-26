//
//  EditProfileViewModel.swift
//  Gains
//
//  Created by Developer on 1/18/24.
//

import PhotosUI
import SwiftUI
import FirebaseFirestore

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await loadImage(fromItem: selectedImage)}}
    }
    
    
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    @Published var level = ""
    

    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
        
        if let level = user.level {
            self.level = level
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func updateUserData() async throws {
        //update profile image if changed
        
        
        var data = [String: Any]()
        
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage, folder: "profile_images")
            data["profileImageUrl"] = imageUrl
        }
        
        
        //update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        //update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        //update level if changed
        if !level.isEmpty && user.level != level {
            data["level"] = level
        }
        

        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
    
}
