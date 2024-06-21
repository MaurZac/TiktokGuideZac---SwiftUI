//
//  UserCell.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48,height: 48)
                .foregroundStyle(Color(.systemGray5))
            
            VStack(alignment: .leading){
                Text("rest_user")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("test_user")
                    .font(.footnote)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
