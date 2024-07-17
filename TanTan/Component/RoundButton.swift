//
//  RoundButton.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import SwiftUI

enum ButtonType:String,CaseIterable,Identifiable {
    var id: RawValue {
        rawValue
    }
    case back = "gobackward"
    case no = "xmark"
    case heart = "heart.fill"
    case star = "star.fill"
}


struct RoundButton: View {
    var type:ButtonType
    var action:(()->Void)
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(12)
                .colorButton(type: type)
        }.buttonStyle(PressScaleButton())

    }
}

struct PressScaleButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}


struct ColorButton:ViewModifier {
    @Environment(AppState.self) var appState
    
    var type:ButtonType
    func body(content: Content) -> some View {
        switch type {
        case .back:
            content.foregroundColor(.yellow)
                .background(.gray.opacity(0.5))
        case .no:
            content.foregroundStyle(.white)
                .padding(.horizontal,30)
                .background(appState.isTabBarHidden ? .yellow : .gray.opacity(0.5))
        case .heart:
            content.foregroundStyle(appState.isTabBarHidden ? .white : .pink)
                .padding(.horizontal,30)
                .background(appState.isTabBarHidden ? .pink :.gray.opacity(0.5))
        case .star:
            content.foregroundStyle(appState.isTabBarHidden ? .white : .blue)
                .background(appState.isTabBarHidden ? .blue :.gray.opacity(0.5))
        }
    }
}

#Preview {
    
    VStack {
        ForEach(ButtonType.allCases) {type in
            RoundButton(type: type) {
                
            }
                .frame(height: 60)
        }
    }.background(Color.accentColor)
        .environment(AppState(isFullScreen: true))
    
    
}
