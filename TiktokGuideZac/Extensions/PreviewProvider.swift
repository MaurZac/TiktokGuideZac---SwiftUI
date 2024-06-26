//
//  PreviewProvider.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/25/24.
//

import Foundation

struct DeveloperPreview {
    static var user = User(id: NSUUID().uuidString,
                      userName: "maur.zac",
                      email: "maur.mx@gmail.com",
                      fullName: "Mauricio Zarate",
                           bio: "",
                           profileImageUrl: "")
    
    static var users: [User] = [
        .init(id: NSUUID().uuidString, userName: "Jac One", email: "jac@gmail.com", fullName: "jasmin", bio: "", profileImageUrl: ""),
        .init(id: NSUUID().uuidString, userName: "Jac Two", email: "jac@gmail.com", fullName: "jasmin1", bio: "", profileImageUrl: ""),
        .init(id: NSUUID().uuidString, userName: "Jac Three", email: "jac@gmail.com", fullName: "jasmin2", bio: "", profileImageUrl: ""),
        .init(id: NSUUID().uuidString, userName: "Jac Four", email: "jac@gmail.com", fullName: "jasmin3", bio: "", profileImageUrl: "")

    ]
}
