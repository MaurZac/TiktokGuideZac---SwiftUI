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
    private var authService: AuthService
     init() {
         FirebaseApp.configure()
         authService = AuthService()
         
     }
  
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService)
        }
    }
}
