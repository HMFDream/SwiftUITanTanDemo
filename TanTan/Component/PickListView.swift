//
//  PickListView.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct PickListView: View {
    var cards:[UserCard]
    var body: some View {
        ZStack(alignment:.bottom) {
            ScrollView(.vertical) {
                Text("Discover the people you like. Updated daily")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .font(.system(size: 16,weight: .medium))
                    .padding(.vertical, 10)
                LazyVGrid(
                    columns:[GridItem(.flexible()),GridItem(.flexible())],
                    alignment: .center,
                    spacing: 10,
                pinnedViews: []) {
                        ForEach(cards) { card in
                            PickView(card: card, blur: true)
                                .frame(height: 240)
                        }
                    
                }.padding(.horizontal,10)
            }
            .scrollIndicators(.hidden)
            
            Button(action: {
                
            }, label: {
                Text("Unlock daily picks")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,15)
                    .foregroundStyle(.white)
                    .background(.accent)
                    .cornerRadius(10)
                    
                    
            })
            .padding(15)
        }
    }
}

#Preview {
    PickListView(cards: HomeViewModel().displayingCard)
}
