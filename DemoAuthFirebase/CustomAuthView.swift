//
//  CustomAuthView.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import SwiftUI
import Firebase

struct CustomAuthView: View {
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
            }


            Button(
                action: {
                    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                        if error != nil {
                            print(error!)
                        } else {
                            print("signIn with email")
                        }
                    }
                }
            ) {
                Text("Email SignIn")
            }

            Button(
                action: {
                    Auth.auth().signInAnonymously() { (result, error) in
                        if error != nil {
                            print(error!)
                        } else {
                            print("signIn as guest")
                        }
                    }
                }
            ) {
                Text("Guest SignIn")
            }
        }
    }
}

struct CustomAuthView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAuthView()
    }
}
