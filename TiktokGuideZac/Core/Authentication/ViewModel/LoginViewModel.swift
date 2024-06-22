//
//  LoginViewModel.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/21/24.
//

import Foundation

class LoginViewModel: ObservableObject{
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do{
            try await authService.login(withEmail: email, password: password)
        }catch{
            print("fail login\(error.localizedDescription)")
        }
    }
}
