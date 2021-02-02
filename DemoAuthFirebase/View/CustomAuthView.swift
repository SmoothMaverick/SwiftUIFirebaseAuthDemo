//
//  CustomAuthView.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import SwiftUI
import Firebase

struct CustomAuthView: View {
    @EnvironmentObject var session: SessionStore
    @State var email : String = ""
    @State var password : String = ""

    var body: some View {
        VStack {
            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }.padding(20)

            Button(
                action: {
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if error != nil {
                            print(error!)
                        } else {
                            print("signUp with email")
                        }
                    }
                }
            ) {
                Text("Email SignUp")
            }.padding()

            Button(
                action: {
                    session.emailSignIn(email: email, password: password)
                }
            ) {
                Text("Email SignIn")
            }.padding()

            Button(
                action: {
                    session.anonSignIn()
                }
            ) {
                Text("Guest SignIn")
            }.padding()

            Button(
                action: {
                    session.googleSignIn()
                }
            ) {
                Text("Google SignIn")
            }.padding()
        }
    }
}

struct CustomAuthView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAuthView()
    }
}
