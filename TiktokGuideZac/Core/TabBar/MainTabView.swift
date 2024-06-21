//
//  MainTabView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
            FeedView()
                .tabItem {
                    VStack{
                        Image(systemName:  selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear { selectedTab = 0}
                .tag(0)
            
            
            Text("Friends")
                .tabItem {
                    VStack{
                        Image(systemName: "person.2")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear { selectedTab = 1}
                .tag(1)
            
            
            Text("Upload post")
                .tabItem {
                    Image(systemName: "plus")
                }
            
            Text("Notifications")
                .tabItem {
                    VStack{
                        Image(systemName: "heart")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear { selectedTab = 3}
                .tag(3)
            
            Text("Profile")
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear { selectedTab = 4}
                .tag(4)
            
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}