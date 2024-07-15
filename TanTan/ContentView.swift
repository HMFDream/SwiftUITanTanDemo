//
//  ContentView.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import SwiftUI

struct ContentView: View {
     
    private var appState = AppState()
    
    var body: some View {
        VStack {
            
            switch appState.selectedTab {
            case .home:
                HomeScreen()
                    .environment(appState)
            case .live:
                Text("home")
            case .message:
                Text("home")
            case .profile:
                Text("home")
            }
            
            if !appState.isTabHidden {
                Spacer()
                HStack {
                    createTabItem(tanItem: .home, title: "home")
                    createTabItem(tanItem: .live, title: "live")
                    createTabItem(tanItem: .message, title: "message")
                    createTabItem(tanItem: .profile, title: "profile")
                }
            }
        }
    }
    
    func createTabItem(tanItem:TabItem, title:String) -> some View {
        
        VStack {
            Image(systemName: tanItem.rawValue)
                .font(.system(size: 24,weight: .bold))
            Text(title)
                .font(.system(size: 10))
        }
        .foregroundColor(appState.selectedTab == tanItem ? .accentColor : .gray.opacity(0.5) )
        .frame(maxWidth: .infinity)
        .onTapGesture {
            appState.selectedTab = tanItem
        }
    }
    
}

enum TabItem: String {
    case home = "rectangle.fill.on.rectangle.fill"
    case live = "play.tv.fill"
    case message = "message.fill"
    case profile = "person.fill"
}

#Preview {
    ContentView()
}
