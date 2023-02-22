//
//  GoogleSignInAuthenticator.swift
//  FoodWise
//
//  Created by dasoya on 17.02.23.
//

import Foundation
import GoogleSignIn

final class GoogleSignInAuthenticator: ObservableObject {
    
    private var authViewModel: AuthenticationViewModel

    /// Creates an instance of this authenticator.
    /// - parameter authViewModel: The view model this authenticator will set logged in status on.
    init(authViewModel: AuthenticationViewModel) {
      self.authViewModel = authViewModel
    }

    /// Signs in the user based upon the selected account.'
    /// - note: Successful calls to this will set the `authViewModel`'s `state` property.
    func signIn() {
  #if os(iOS)
      guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
        print("There is no root view controller!")
        return
      }

      GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
        guard let signInResult = signInResult else {
          print("Error! \(String(describing: error))")
          return
        }
        self.authViewModel.state = .signedIn(signInResult.user)
      }

  #elseif os(macOS)
      guard let presentingWindow = NSApplication.shared.windows.first else {
        print("There is no presenting window!")
        return
      }

      GIDSignIn.sharedInstance.signIn(withPresenting: presentingWindow) { signInResult, error in
        guard let signInResult = signInResult else {
          print("Error! \(String(describing: error))")
          return
        }
        self.authViewModel.state = .signedIn(signInResult.user)
      }
  #endif
    }

    /// Signs out the current user.
    func signOut() {
      GIDSignIn.sharedInstance.signOut()
      authViewModel.state = .signedOut
    }

    /// Disconnects the previously granted scope and signs the user out.
    func disconnect() {
      GIDSignIn.sharedInstance.disconnect { error in
        if let error = error {
          print("Encountered error disconnecting scope: \(error).")
        }
        self.signOut()
      }
    }
}
