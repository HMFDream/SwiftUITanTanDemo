//
//  User.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import Foundation

struct User {
    var name:String
    var photo:String
}

extension User {
    static let Me = User(name: "UserSent", photo: "User1")
    static let Others = User(name: "UserReceived", photo: "User2")
}
