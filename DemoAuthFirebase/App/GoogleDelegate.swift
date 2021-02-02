//
//  GoogleDelegate.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 2/1/21.
//

import Firebase
import GoogleSignIn

class GoogleDelegate: NSObject, ObservableObject, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // Check for sign in error
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }

        // Get credential object using Google ID token and Google access token
        guard let authentication = user.authentication else {
            return
        }

        let credential = GoogleAuthProvider.credential(
            withIDToken: authentication.idToken,
            accessToken: authentication.accessToken
        )

        // Authenticate with Firebase using the Google credential object
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Error occurs when authenticate with Firebase: \(error.localizedDescription)")
            }
        }
    }
}
