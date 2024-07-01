//
//  ContentViewModel.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/21/24.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
     
    private let authService: AuthService
    private let userService: UserService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        setupSubscribers()
        authService.updateUserSession()
    }
    
    private func setupSubscribers(){
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user
            self?.fetchCurrentUser()
        }.store(in: &cancellables)
    }
    
    func fetchCurrentUser(){
        guard userSession != nil else {return }
        DispatchQueue.main.async {
            Task {self.currentUser = try await self.userService.fetchCurrentUser() }
        }
        
    }
}
