//
//  User.swift
//  DemoAuthFirebase
//
//  Created by Jason Hoang on 2/1/21.
//

import Foundation

struct User: Identifiable, Equatable {
    let id: String
    var name: String
    var email: String
}
