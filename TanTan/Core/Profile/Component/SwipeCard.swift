//
//  SwipeCard.swift
//  TanTan
//
//  Created by hmf on 2024/7/18.
//

import SwiftUI

struct SwipeCard: View {
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                SingleSwipeCard(title: "Get TanTan Gold", description: "See Who likes you & more!")
                SingleSwipeCard(title: "Get TanTan Gold", description: "See Who likes you & more!")
                SingleSwipeCard(title: "Get TanTan Gold", description: "See Who likes you & more!")
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(.bottom, 40)
            
            Button(action: {
                
            }, label: {
                Text("MY TANTAN PLUS")
                    .font(.system(size: 18,weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.2), radius: 10)
            })
            .padding(.bottom,30)
            
        }
        
    }
    
    struct SingleSwipeCard:View {
        var title:String
        var description:String
        var body: some View {
            VStack {
                Spacer()
                Text(title)
                    .font(.system(size: 26, weight: .semibold))
                Text(description)
                Spacer()
            }
        }
    }
}

#Preview {
    SwipeCard()
}
