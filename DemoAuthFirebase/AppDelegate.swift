//
//  AppDelegate.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import Firebase
import FirebaseUI

class AppDelegate: NSObject, UIApplicationDelegate, FUIAuthDelegate{
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()

        let authUI = FUIAuth.defaultAuthUI()!
        authUI.delegate = self

        let providers: [FUIAuthProvider] = [
            FUIEmailAuth(),
            FUIAnonymousAuth(),
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

        return true
    }
}
