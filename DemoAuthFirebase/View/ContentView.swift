//
//  ContentView.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore

    func getUser(){
        print("start listen")
        session.listen()
    }

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: CustomAuthView()
                ) {
                    Text("Custom Authentication")
                }.padding()


                NavigationLink(
                    destination: StockAuthView()
                ) {
                    Text("Pre-built Authentication")
                }.padding()

                Button(
                    action: {
                        session.signOut()
                    }
                ) {
                    Text("Sign Out")
                }.padding()
            }
        }
        .onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
