//
//  ContentView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
        let vm = ContentViewModel(authService: authService)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                MainTabView(authService: authService)
            }else {
                LogView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService())
}
