//
//  EditProfileManager.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 7/2/24.
//

import Foundation
import Firebase

class EditProfileManager: ObservableObject{
    private let imageUploader: ImageUploader
    
    init(imageUploader: ImageUploader) {
        self.imageUploader = imageUploader
    }
    
    func uploadProfileImage(_ uiimage: UIImage) async {
        do{
            let profileImageUrl = try await imageUploader.uploadImage(image: uiimage)
            try await updateUserProfileImageUrl(profileImageUrl)
        }catch{
            print("Debug: Handle image upload error here..")
        }
    }
    
    private func updateUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else {return }
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        try await FireStoreConstants.UsersCollection.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
    }
}
