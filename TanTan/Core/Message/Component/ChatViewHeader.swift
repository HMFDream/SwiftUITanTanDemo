//
//  ChatViewHeader.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct ChatViewHeader: View {
    
    @Environment(\.dismiss) var dismiss
    var name:String
    var photo:String
    var videoAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                        .font(.system(size: 28, weight: .semibold))
                })
                Spacer()
                VStack(spacing: 5) {
                    CircleAvator(photo: photo, size: 50)
                    Text(name)
                        .foregroundStyle(.gray)
                        .font(.system(size: 14))
                }
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 25, weight: .bold))
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
        }
        .frame(height: 50)
    }
}

#Preview {
    ChatViewHeader(name: User.Others.name, photo: User.Others.photo, videoAction: {})
}
