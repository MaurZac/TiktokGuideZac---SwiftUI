//
//  UserProfileView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/26/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    var body: some View {
        ScrollView{
            VStack(spacing:2){
                ProfileHeaderView(user: user)
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
