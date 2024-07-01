//
//  UserService.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/25/24.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

protocol UserServiceProtocol{
    func fetchUsers() async throws -> [User]
}

struct UserService: UserServiceProtocol {
    
    func fetchCurrentUser() async throws -> User? {
        guard let currentUid = Auth.auth().currentUser?.uid else  {return nil }
    
        let currentUser = try await FireStoreConstants.UsersCollection.document(currentUid).getDocument(as: User.self)
        return currentUser
    }
    
    func uploadUserData(_ user: User) async throws{
        do{
            let userData = try Firestore.Encoder().encode(user)
            try await FireStoreConstants.UsersCollection.document(user.id).setData(userData)
        }catch{
            throw error
        }
    }
    
    func fetchUsers() async throws -> [User]{
        
           let snapshot = try await FireStoreConstants.UsersCollection.getDocuments()
            return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}

struct MockUserService: UserServiceProtocol{
    func fetchUsers() async throws -> [User] {
        return DeveloperPreview.users
    }
}
