//
//  ChatView.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct ChatView: View {
    private var chatManager:ChatManager
    var user:User
    init(user: User) {
        self.chatManager = ChatManager(user: user)
        self.user = user
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(chatManager.messages.indices, id:\.self) { index in
                    
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    ChatView(user: User.Others)
}
