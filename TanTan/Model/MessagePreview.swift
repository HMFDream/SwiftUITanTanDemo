//
//  MessagePreview.swift
//  TanTan
//
//  Created by hmf on 2024/7/17.
//

import Foundation

struct MessagePreview {
    var user:User
    var lastMessage:String
}

extension MessagePreview {
    static let example = MessagePreview(user: User.Others, lastMessage: "Tnank you!")
    static let examples = [
        MessagePreview(user: User.Others, lastMessage: "From First User"),
        MessagePreview(user: User.Others2, lastMessage: "From Second User")
    ]
}
