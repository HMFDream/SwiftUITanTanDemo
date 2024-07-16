//
//  ChatView.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct ChatView: View {
    private var chatManager:ChatManager
    
    @State private var typeMessage:String = ""
    
    var user:User
    init(user: User) {
        self.chatManager = ChatManager(user: user)
        self.user = user
    }
    
    var body: some View {
        ZStack(alignment:.top) {
            VStack {
                Spacer(minLength: 80)
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(chatManager.messages.indices, id:\.self) { index in
                            MessageView(message: chatManager.messages[index])
                        }
                    }
                }.scrollIndicators(.hidden)
                ZStack(alignment: .trailing) {
                    Color.gray.opacity(0.1)
                    TextField("Type a message", text: $typeMessage)
                        .foregroundStyle(.gray)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        sendMessage()
                    }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundColor(typeMessage.isEmpty ? .gray : .accent)
                }
                .frame(height: 45)
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.3), lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            ChatViewHeader(name: user.name, photo: user.photo) {
                
            }
        }
    }
    
    func sendMessage() {
        chatManager.sendMessage(Message(content: typeMessage))
        typeMessage = ""
    }
}

#Preview {
    ChatView(user: User.Others)
}
