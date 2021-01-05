//
//  StockAuthView.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import SwiftUI
import FirebaseUI

struct StockAuthView: View {
    var body: some View {
        AuthView()
    }
}

struct AuthView: UIViewControllerRepresentable {
    let viewController = FUIAuth.defaultAuthUI()!.authViewController()

    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(viewController: viewController)
    }

    final class Coordinator {
        let viewController: UIViewController

        init(viewController: UIViewController) {
            self.viewController = viewController
        }
    }
}

extension AuthView.Coordinator {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if error != nil {
            print("ERROR: \(String(describing: error))")
        } else {
            print("login successful")
        }
    }
}
