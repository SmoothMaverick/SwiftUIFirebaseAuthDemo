//
//  AppDelegate.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import Foundation
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
