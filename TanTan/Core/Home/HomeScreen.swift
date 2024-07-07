//
//  HomeScreen.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import SwiftUI

struct HomeScreen: View {
    
    var viewModel = HomeViewModel()
    
    var body: some View {
        if viewModel.displayingCard.isEmpty {
            NoResultView()
        } else {
            CardContainerView(viewModel: viewModel)
        }
    }
}

#Preview {
    HomeScreen()
}
