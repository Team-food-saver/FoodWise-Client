//
//  FoodWiseApp.swift
//  FoodWise
//
//  Created by dasoya on 17.02.23.
//

import SwiftUI
import GoogleSignIn

@main
struct FoodWiseApp: App {
    
    @StateObject var authViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .onAppear {
                  GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                    if let user = user {
                      self.authViewModel.state = .signedIn(user)
                    } else if let error = error {
                      self.authViewModel.state = .signedOut
                      print("There was an error restoring the previous sign-in: \(error)")
                    } else {
                      self.authViewModel.state = .signedOut
                    }
                  }
                }
                .onOpenURL { url in
                          GIDSignIn.sharedInstance.handle(url)
                        }
                
        }
    }
}
