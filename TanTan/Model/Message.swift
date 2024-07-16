//
//  Message.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import Foundation

struct Message {
    var content:String
    var user:User?
    var isCurrentUser:Bool {
        user == nil
    }
}

extension Message {
    static let messageSent = Message(content: "Hi! How are you")
    static let messageReceived = Message(content: "I am fine. Thank you!", user: User.Others)
}
