//
//  CurrentUserProfileView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let authService: AuthService
    let user: User
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
                    //profile header
                    ProfileHeaderView(user: user)
                    
                    //post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button("Sign Out"){
                        authService.signOut()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService(), user: DeveloperPreview.user)
}
