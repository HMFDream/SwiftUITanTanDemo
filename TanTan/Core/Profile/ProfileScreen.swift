//
//  ProfileScreen.swift
//  TanTan
//
//  Created by hmf on 2024/7/17.
//

import SwiftUI

struct ProfileScreen: View {
    var user:User
    var body: some View {
        VStack(spacing: 0, content: {
            ZStack(alignment: .topTrailing, content: {
                CircleAvator(photo: user.photo, size: 100)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 10, weight: .heavy))
                        .foregroundColor(.gray.opacity(0.5))
                        .frame(width: 32,height: 32)
                        .background(.white)
                        .clipShape(Circle())
                })
                .padding(.vertical, 10)
                .offset(x:10,y: -10)
            })
            .padding()
            
            Text(user.name)
                .font(.system(size: 20, weight: .medium))
            HStack(alignment:.top) {
                Spacer()
                CustomButton(icon: "gearshape.fill", title: "SETTINGS")
                Spacer()
                CustomButton(icon: "camera.fill", title: "ADD MEDIA", isCenter: true)
                Spacer()
                CustomButton(icon: "shield.fill", title: "SAFETY")
                Spacer()
            }
            .padding(.vertical, 20)
            
            HStack {
                Text("Photo Tip: Make waves with a beach photo and get more likes")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 12,weight: .heavy))
                        .foregroundColor(.accent)
                        .padding(6)
                        .background(.white)
                        .clipShape(Circle())
                })
            }
            .padding(20)
            .background(.accent.opacity(0.5))
            .cornerRadius(12)
            
            Spacer()
            
        })
    }
    
    struct CustomButton:View {
        
        var icon:String
        var title:String
        var isCenter:Bool = false
        var body: some View {
            VStack(spacing: 10) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: icon)
                        .foregroundStyle(isCenter ? .white :.gray.opacity(0.5))
                        .font(.system(size: isCenter ? 30 : 26))
                        .padding(isCenter ? 20 : 10)
                        .background(isCenter ? .accent : .white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                })
                
                Text(title)
                    .font(.system(size: 14,weight: .medium))
                    .foregroundStyle(.gray.opacity(0.6))
            }
        }
    }
    
    
}

#Preview {
    ProfileScreen(user: .Me)
}
