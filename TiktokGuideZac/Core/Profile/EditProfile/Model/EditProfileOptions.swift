//
//  EditProfileOptions.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/30/24.
//

import Foundation

enum EditProfileOptions: Hashable {
    case name
    case username
    case bio
    
    var title: String{
        switch self {
        case .name:
            return "Name"
        case .username:
            return "Username"
        case .bio:
            return "Bio"
        }
    }
}
