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
                            isEditing = true
                        }
                    
                    if isEditing {
                        Button(action: {
                            isEditing = false
                            searchText = ""
                            endEditing(true)
                        }, label: {
                            Text("Cancel")
                        })
                        .padding(.trailing,15)
                        .transition(.move(edge: .trailing))
                    }
                }
                Text("Content")
                Spacer()
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    MessageListScreen()
}
