//
//  ChatManager.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import Foundation
import Combine
import UIKit

@Observable final class ChatManager {
    var messages:[Message] = []
    var user:User
    
    var keyboardIsShowing:Bool = false
    var keyboardPublisher: AnyCancellable? = nil
    
    
    init(user: User) {
        self.user = user
        loadMessages()
        setUpPublisher()
    }
    
    func loadMessages() {
        messages = [Message.messageSent, Message.messageReceived]
    }
    
    func sendMessage(_ message:Message) {
        messages.append(message)
    }
    
    func setUpPublisher() {
        keyboardPublisher = Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification).map { _ in true},
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false}
        )
        .subscribe(on: DispatchQueue.main)
        .assign(to: \.keyboardIsShowing, on: self)
    }
    
    
}
