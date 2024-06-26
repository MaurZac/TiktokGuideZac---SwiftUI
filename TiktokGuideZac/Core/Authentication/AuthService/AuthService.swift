//
//  AuthService.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/21/24.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    private let userService = UserService()
    
    init(userSession: FirebaseAuth.User? = nil) {
        self.userSession = Auth.auth().currentUser
    }
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String,
               password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Login with email \(result.user.uid)")
        }catch{
            print("error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    userName: String,
                    fullName: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadInfoUserData(withEmail: email, id: result.user.uid, userName: userName, fullName: fullName)
        }catch{
            print("Fail creating user \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadInfoUserData(withEmail email: String,
                                    id: String,
                                    userName: String,
                                    fullName: String) async throws{
        let user = User(id: id, userName: userName, email: email, fullName: fullName,bio: "", profileImageUrl: "")
        try await userService.uploadUserData(user)
        
        
    }
    
}
