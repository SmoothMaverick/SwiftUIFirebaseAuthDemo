//
//  AppDelegate.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import Firebase
import FirebaseUI
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate, FUIAuthDelegate{
    let googleDelegate = GoogleDelegate()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()

        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = googleDelegate

        let authUI = FUIAuth.defaultAuthUI()!
        authUI.delegate = self

        let providers: [FUIAuthProvider] = [
            FUIEmailAuth(),
            FUIAnonymousAuth(),
            FUIGoogleAuth(),
        ]

        authUI.providers = providers

        return true
    }

    func application(
        _ application: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any]
    ) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
          return true
        }

        GIDSignIn.sharedInstance().handle(url)

        return true
    }
}
