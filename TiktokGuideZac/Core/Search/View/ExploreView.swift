//
//  ExploreView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var viewModel = ExploreViewModel(userServices: UserService())
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 16){
                    ForEach(viewModel.users){ user in
                        NavigationLink(value: user){
                            UserCell(user: user)
                        }
                        
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExploreView()
}
