//
//  ProfileHeaderView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    let user: User
    var body: some View {
        VStack(spacing:16){
            VStack(spacing: 8){
                AvatarView(user: user, size: .large)
                
                //username
                Text("@\(user.userName)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            HStack(spacing:16){
                UserStatView(value: 5, title: "Following")
                UserStatView(value: 1, title: "Follower")
                UserStatView(value: 9, title: "Likes")
                
            }
            //action button
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            Divider()

        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}
