//
//  CardContainerView.swift
//  TanTan
//
//  Created by hmf on 2024/7/8.
//

import SwiftUI

struct CardContainerView: View {
    @Environment(AppState.self) var appState
    @Namespace var namespace
    var viewModel:HomeViewModel
    var card:UserCard
    var body: some View {
        if appState.isFullScreen {
            CardDetailView(namespace: namespace, card: card)
                .background(.white)
                .environment(appState)
        } else {
            ZStack(alignment:.bottom) {
                UserCardView(userCard: card, swipeAction: viewModel.nextUserCard)
                    .matchedGeometryEffect(id: card.id, in: namespace)
                    .environment(appState)
                HStack{
                    ForEach(ButtonType.allCases) {type in
                        RoundButton(type: type, action: {
                            switch type {
                            case .back:
                                debugPrint("back")
                            case .no:
                                viewModel.nextUserCard()
                            case .heart:
                                viewModel.nextUserCard()
                            case .star:
                                debugPrint("star")
                            }
                            
                        })
                            .frame(height: 45)
                    }
                }
                .padding(.bottom,15)
            }
            .padding(.horizontal,20)
            .padding(.vertical, 20)
        }
        
        
    }
}

#Preview {
    CardContainerView(viewModel: HomeViewModel(), card:  .init(name: "Jame", age: 23, place: "New York", zodiac: "Cancer", photos: ["User1"])).environment(AppState())
}
