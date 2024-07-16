//
//  ChatManager.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import Foundation

@Observable final class ChatManager {
    var messages:[Message] = []
    var user:User
    
    init(user: User) {
        self.user = user
        loadMessages()
    }
    
    func loadMessages() {
        messages = [Message.messageSent, Message.messageReceived]
    }
    
    func sendMessage(_ message:Message) {
        messages.append(message)
    }
    
    
}
