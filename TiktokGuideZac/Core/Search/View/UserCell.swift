//
//  UserCell.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12){
            AvatarView(user: user, size: .medium)
                    
            
            VStack(alignment: .leading){
                Text("\(user.userName)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("\(user.fullName)")
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.user)
}
