//
//  ImageUploader.swift
//  Gains
//
//  Created by Developer on 1/18/24.
//


import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, folder: String) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/\(folder)/\(filename)")
        
        do {
            let _  = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }
        catch {
            print("DEBUG: failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}

