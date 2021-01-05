//
//  ContentView.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 1/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: CustomAuthView()
                ) {
                    Text("Custom Authentication")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
