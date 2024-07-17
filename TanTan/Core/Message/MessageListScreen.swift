//
//  MessageListScreen.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct MessageListScreen: View {
    
    var vm = MessageListViewModel()
    @State var searchText:String = ""
    @State var isEditing:Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Message")
                        .font(.system(size: 25, weight: .bold))
                        .padding([.leading, .top], 15)
                    Spacer()
                }
                HStack(spacing: 0) {
                    TextField("Search Matched", text: $searchText)
                        .textInputAutocapitalization(.never)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(8)
                        .overlay {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 20,weight: .semibold))
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 15)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                isEditing = true
                            }
                        }
                    
                    if isEditing {
                        Button(action: {
                            withAnimation(.easeIn(duration: 0.25)) {
                                isEditing = false
                            }
                            searchText = ""
                            endEditing(true)
                        }, label: {
                            Text("Cancel")
                        })
                        .padding(.trailing,15)
                        .transition(.move(edge: .trailing))
                    }
                }
                
                VStack {
                    ForEach(vm.messagePreviews.filter {
                        searchText.isEmpty ? true : displayPreview($0)
                    }, id: \.self) { preview in
                        NavigationLink {
                            ChatView(user: preview.user)
                        } label: {
                            MessageListRowView(messagePreview: preview)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                            Spacer()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .animation(.easeIn(duration: 0.25))
                        .transition(.slide)
                        

                    }
                }
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func displayPreview(_ preview:MessagePreview) -> Bool {
        if preview.user.name.contains(searchText) {
            return true
        }
        
        if preview.lastMessage.contains(searchText) {
            return true
        }
        
        return false
    }
    
}

#Preview {
    MessageListScreen()
}
