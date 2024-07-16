//
//  ChatView.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct ChatView: View {
    private var chatManager:ChatManager
    
    @State private var typingMessage:String = ""
    @State var scrollProxy:ScrollViewProxy? = nil
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
                    ScrollViewReader {proxy in
                        VStack {
                            ForEach(chatManager.messages) { messgae in
                                MessageView(message: messgae)
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                    }
                }
                .scrollIndicators(.hidden)
                ZStack(alignment: .trailing) {
                    Color.gray.opacity(0.1)
                    TextField("Type a message", text: $typingMessage)
                        .foregroundStyle(.gray)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        sendMessage()
                    }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? .gray : .accent)
                }
                .frame(height: 45)
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.3), lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            ChatViewHeader(name: user.name, photo: user.photo) {}
        }
        .onChange(of: chatManager.messages.count) {
            scrollToBottom()
        }
        .onChange(of: chatManager.messages.count, perform: { _ in
            scrollToBottom()
        })
    }
    
    func sendMessage() {
        chatManager.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(chatManager.messages.last?.id,anchor: .bottom)
        }
    }
}

#Preview {
    ChatView(user: User.Others)
}
