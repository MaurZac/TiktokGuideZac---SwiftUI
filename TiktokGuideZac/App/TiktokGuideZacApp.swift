//
//  TiktokGuideZacApp.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    return true
  }
}

@main
struct TiktokGuideZacApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let authService: AuthService
    private let userService: UserService
     init() {
         FirebaseApp.configure()
         authService = AuthService()
         userService = UserService()
     }
  
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService, userService: userService)
        }
    }
}
