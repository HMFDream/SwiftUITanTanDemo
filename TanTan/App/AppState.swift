//
//  AppState.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import Foundation

@Observable class AppState {
    var selectedTab:TabItem = .home
    var isTabHidden:Bool = false
    var isFullScreen:Bool = false
    
    init(selectedTab: TabItem = .home, isTabHidden: Bool = false, isFullScreen: Bool = false) {
        self.selectedTab = selectedTab
        self.isTabHidden = isTabHidden
        self.isFullScreen = isFullScreen
    }
}

