//
//  CardDetailView.swift
//  TanTan
//
//  Created by hmf on 2024/7/8.
//

import SwiftUI

struct CardDetailView: View {
    @Environment(AppState.self) var appState
    var namespace:Namespace.ID
    var card:UserCard
    var body: some View {
        let screen = UIScreen.main.bounds
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 0) {
                    UserCardView(userCard:card)
                        .animation(.easeInOut(duration: 0.1))
                        .matchedGeometryEffect(id: card.id, in: namespace)
                        .frame(width: screen.width,height: screen.height * 0.7)
                        .environment(appState)
                    
                    HStack {
                        VStack(alignment: .leading, content: {
                            HStack() {
                                Text(card.name)
                                    .font(.system(size: 32,weight: .bold))
                                Text("\(card.age)")
                                    .font(.system(size:28,weight: .light))
                                Spacer()

                            }
                            Text(card.place)
                                .font(.system(size:18,weight: .light))
                        })
                        .padding([.horizontal,.top],20)
                        
                        Button(action: {
                            appState.isFullScreen = false
                        }, label: {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.system(size: 40))
                                .background(.white)
                                .clipShape(Circle())
                            
                        })
                        .padding(.trailing, 30)
                        .offset(y:-40)
                    }
                    
                    Spacer(minLength: 20)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.system(size: 18,weight: .medium))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal,20)
                }
                Spacer(minLength: 20)
                VStack(spacing:20) {
                    Button(action: {
                        showActionSheet()
                    }, label: {
                        VStack(spacing: 8) {
                            Text("SHARE \(card.name.uppercased())'S PROFILE")
                                .font(.system(size: 16, weight: .medium))
                            Text("SEE WHAT A FRIEND THINKS")
                                .font(.system(size: 14, weight: .medium))
                        }
                    })
                    
                    Button {
                        
                    } label: {
                        Text("REPORT \(card.name.uppercased())")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.black)
                            .opacity(0.75)
                    }
                }
                Spacer(minLength: 200)
            }
            .scrollIndicators(.hidden)
            
            HStack(spacing:20) {
                RoundButton(type:.no, action: {
                    
                })
                RoundButton(type: .star) {
                    
                }
                RoundButton(type: .heart) {
                    
                }
            }
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .padding(.bottom,45)
            .background(
                LinearGradient(gradient: Gradient(colors: [.white.opacity(0.2), .white]), startPoint: .top, endPoint: .bottom)
            )
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
    
    
    
    func showActionSheet(){
        let items = ["what do you think about \(card.name)? \n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true)
    }
    
}
