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
}

