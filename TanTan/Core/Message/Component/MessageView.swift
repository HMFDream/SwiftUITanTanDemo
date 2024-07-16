//
//  MessageView.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct MessageView: View {
    var message:Message
    var body: some View {
        HStack {
            if message.isCurrentUser {
                Spacer()
            }
            
            Text(message.content)
                .padding(10)
                .background(message.isCurrentUser ? .accent : .gray.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
            if !message.isCurrentUser {
                Spacer()
            }
        }.padding()
    }
}

#Preview {
    VStack {
        MessageView(message: Message.messageSent)
        MessageView(message: Message.messageReceived)
    }
}
