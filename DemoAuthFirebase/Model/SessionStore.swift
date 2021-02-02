//
//  SessionStore.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 2/1/21.
//

import Foundation

import Firebase
import Combine
import GoogleSignIn

class SessionStore : ObservableObject {
    let uid = Auth.auth().currentUser?.uid ?? "uid"
    let name = Auth.auth().currentUser?.displayName ?? ""

    var didChange = PassthroughSubject<SessionStore, Never>()
    var handle: AuthStateDidChangeListenerHandle?

    @Published var session : User? {
        didSet {
            self.didChange.send(self)
        }
    }

    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("user state changed: \(user.displayName ?? "")")
                self.session = User(
                    id: user.uid,
                    name: user.displayName ?? "",
                    email: user.email ?? ""
                )
            } else {
                self.session = nil
            }
        }
    }

    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func emailSignIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error!)
            } else {
                print("signIn with email")
            }
        }
    }

    func anonSignIn() {
        Auth.auth().signInAnonymously() { (result, error) in
            if error != nil {
                print(error!)
            }
        }
    }

    func googleSignIn() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        GIDSignIn.sharedInstance().signIn()
    }

    func signOut(){
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            print("Error signing out")
        }
    }
}
