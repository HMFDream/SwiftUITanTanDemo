//
//  HomeScreen.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import SwiftUI

struct HomeScreen: View {
    
    @Environment(AppState.self) var appState 
    
    @Bindable var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            if !appState.isTabBarHidden {
                HStack {
                    HomeTitleButton(selectedTitle: $viewModel.selectedTitle, title: .TANTAN)
                    HomeTitleButton(selectedTitle: $viewModel.selectedTitle, title: .PICKS)
                    Spacer()
                }
                .padding([.top,.leading],15)
            }
            switchTab()
        }
    }
    
    @ViewBuilder
    func switchTab() -> some View {
        switch viewModel.selectedTitle {
        case .TANTAN: 
            if viewModel.displayingCard.isEmpty {
                NoResultView()
            } else {
                ZStack{
                    ForEach(viewModel.displayingCard.reversed()) {card in
                        CardContainerView(viewModel: viewModel,card: card).environment(appState)
                    }
                }
            }
        case .PICKS:
            PickListView(cards: viewModel.displayingCard)
        }
    }
    
    
    enum HomeTitle:String {
        case TANTAN
        case PICKS
    }
}


struct HomeTitleButton: View {
    @Binding var selectedTitle:HomeScreen.HomeTitle
    var title:HomeScreen.HomeTitle
    var body: some View {
        Button(action: {
            selectedTitle = title
        }, label: {
            Text(title.rawValue)
                .font(.system(size: 25,weight: .bold))
                .foregroundStyle(selectedTitle == title ? .accent : .gray.opacity(0.6))
        })
    }
}


#Preview {
    HomeScreen().environment(AppState())
}
