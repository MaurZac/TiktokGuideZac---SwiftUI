//
//  User.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/25/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let userName: String
    let email: String
    let fullName: String
    let bio: String?
    let profileImageUrl: String?
    
}

extension User: Hashable{}
