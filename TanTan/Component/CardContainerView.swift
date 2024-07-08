//
//  CardContainerView.swift
//  TanTan
//
//  Created by hmf on 2024/7/8.
//

import SwiftUI

struct CardContainerView: View {
    var viewModel:HomeViewModel
    var body: some View {
        ZStack(alignment:.bottom) {
            ForEach(0 ..< viewModel.displayingCard.count, id: \.self) { index in
                UserCardView(userCard: viewModel.displayingCard[viewModel.displayingCard.count - 1 - index], swipeAction: viewModel.nextUserCard)
            }
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
        .padding(.vertical, 50)
    }
}

#Preview {
    CardContainerView(viewModel: HomeViewModel())
}
