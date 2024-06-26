//
//  ExploreViewModel.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/25/24.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    private let userService: UserServiceProtocol
    
    init(userServices: UserServiceProtocol) {
        self.userService = userServices
        Task {await fetchUsers()}
    }
    
    func fetchUsers() async {
        do{
            self.users = try await userService.fetchUsers()
        }catch{
            print("Fail to get users with error \(error.localizedDescription)")
        }
    }
}
