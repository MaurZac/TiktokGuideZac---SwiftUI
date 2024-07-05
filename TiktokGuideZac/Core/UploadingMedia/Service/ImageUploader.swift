//
//  ImageUploader.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 7/2/24.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let filename = NSUUID().uuidString
        let refe = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        do{
            let _ = try await refe.putDataAsync(imageData)
            let url = try await refe.downloadURL()
            return url.absoluteString
        }catch{
            print("DEBUG Service ImageUpLoader:\(error.localizedDescription)")
            return nil
        }
    }
}
