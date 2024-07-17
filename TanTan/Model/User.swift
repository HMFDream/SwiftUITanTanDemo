//
//  User.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import Foundation

struct User: Hashable {
    var name:String
    var photo:String
}

extension User {
    static let Me = User(name: "UserSent", photo: "User1")
    static let Others = User(name: "User1", photo: "User2")
    static let Others2 = User(name: "User2", photo: "User2")
}
