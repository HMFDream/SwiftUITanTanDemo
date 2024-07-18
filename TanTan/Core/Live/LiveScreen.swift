//
//  LiveScreen.swift
//  TanTan
//
//  Created by hmf on 2024/7/18.
//

import SwiftUI

struct LiveScreen: View {
    var vm = LiveViewModel()
    var body: some View {
        VStack(spacing: 0, content: {
            HStack {
                Text("Live")
                    .font(.system(size: 25,weight: .bold))
                    .padding([.leading, .top], 15)
                Spacer()
            }
            HStack {
                ForEach(LiveTitle.allCases) { tab in
                    Button(action: {
                        vm.selectedTab = tab
                    }, label: {
                        Text(tab.rawValue)
                            .font(.system(size: 14))
                            .padding(10)
                            .foregroundStyle(vm.selectedTab == tab ? .white : .gray)
                            .background(vm.selectedTab == tab ? .accent : .white)
                            .cornerRadius(20)
                    })
                   
                }
                Spacer()
            }.padding()
            ScrollView(.vertical) {
                switchTab()
            }.scrollIndicators(.hidden)
            
        })
    }
    
    @ViewBuilder
    func switchTab() -> some View {
        switch vm.selectedTab {
        case .Feature:
            LazyVGrid(
                columns: [GridItem(.flexible()),GridItem(.flexible())],
                alignment: .center,
                spacing: 10,
                pinnedViews: [],
                content: {
                    ForEach(vm.featureCard) { card in
                        PickView(card: card, blur: false).frame(height: 250)
                    }
            })
            .padding(.horizontal,20)
        case .NearBy:
            LazyVGrid(
                columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())],
                alignment: .center,
                spacing: 10,
                pinnedViews: [],
                content: {
                    ForEach(vm.nearByCard) { card in
                        PickView(card: card, blur: false).frame(height: 150)
                    }
            })
            .padding(.horizontal,20)
        }
    }
    
     
}

enum LiveTitle:String, CaseIterable, Identifiable {
    var id: RawValue {
        rawValue
    }
    
    case Feature
    case NearBy
}

#Preview {
    LiveScreen()
}
