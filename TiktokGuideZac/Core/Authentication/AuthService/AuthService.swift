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
            print("DEBUG: user is \(result.user.uid)")
        }catch{
            print("Fail creating user \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
