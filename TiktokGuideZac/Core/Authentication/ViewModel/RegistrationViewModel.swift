//
//  RegistrationViewModel.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/21/24.
//

import Foundation

class RegistrationViewModel: ObservableObject{
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser(withEmail email: String, 
                    password: String,
                    userName: String,
                    fullName: String) async {
        do{
            try await authService.createUser(withEmail: email,
                                             password: password,
                                             userName: userName,
                                             fullName: fullName)
        }catch{
            print("fail login\(error.localizedDescription)")
        }
    }
}
