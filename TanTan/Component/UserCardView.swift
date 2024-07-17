//
//  CardVeiew.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import SwiftUI

struct UserCardView: View {
    var userCard:UserCard
    var swipeAction:(() -> Void)?
    @Environment(AppState.self) var appState
    @State var imageIndex = 0
    @State var offset:CGSize = .zero
    var body: some View {
        GeometryReader(content: { geometry in
            let frameWidth = geometry.size.width
            let frameHeight = geometry.size.height
            ZStack(alignment: .top){
                Image(userCard.photos[imageIndex])
                    .resizable()
                    .frame(width: frameWidth,height: frameHeight)
                    .cornerRadius(appState.isTabBarHidden ? 0 : 20)
                HStack {
                    Rectangle().onTapGesture {
                        frontImage()
                    }
                    Rectangle().onTapGesture {
                        nextImage()
                    }
                }
                .foregroundColor(.white.opacity(0.01))
                HStack {
                    ForEach(0 ..< userCard.photos.count, id:\.self ) { i in
                        RoundedRectangle(cornerRadius:  20)
                            .frame(height: 4)
                            .foregroundColor(imageIndex == i ? .white : .gray.opacity(0.5))
                    }
                }
                .padding(.top,10)
                .padding(.horizontal,10)
                VStack {
                    HStack {
                        if offset.width > 0 {
                            createUserCardLabel(title: "LIKE", degree: -20, color: .green)
                            Spacer()
                        } else if offset.width < 0 {
                            Spacer()
                            createUserCardLabel(title: "NOPE", degree: 20, color: .red)
                        }
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 30)
                    Spacer()
                    if !appState.isTabBarHidden {
                        createUserCardBottomInfo()
                    }
                }
            }
            .offset(offset)
            .scaleEffect(getScaleAmount())
            .rotationEffect(Angle(degrees: getRoationAmount()))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        guard !appState.isTabBarHidden else {return}
                        withAnimation(.easeInOut(duration: 0.2)) {
                            offset = value.translation
                        }
                    })
                    .onEnded({ value in
                        guard !appState.isTabBarHidden else {return}
                        withAnimation(.easeInOut(duration: 0.2)) {
                            let screenCutoff = frameWidth / 2 * 0.8
                            let trans = abs(value.translation.width)
                            if trans > screenCutoff {
                                offset = CGSize(width: frameWidth, height: frameHeight)
                                if (swipeAction != nil) {
                                    swipeAction!()
                                }
                            } else {
                                offset = .zero
                            }
                        }
                    })
            )
        })
        
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width/2
        let current = abs(offset.width)
        let per = current / max
        return  1 - per * 0.5
    }
    
    func getRoationAmount() -> Double {
        let max = UIScreen.main.bounds.width
        let current = offset.width
        let per = current / max
        return Double(per * 10)
        
    }
    
    func createUserCardLabel(title:String, degree: Double , color:Color) -> some View {
        Text(title)
            .tracking(3)
            .foregroundStyle(color)
            .font(.title)
            .fontWeight(.bold)
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: 5).stroke(color, lineWidth: 3)
            }
            .rotationEffect(.degrees(degree))
    }
    
    func createUserCardBottomInfo() -> some View {
        HStack {
            VStack(alignment:.leading,spacing: 5) {
                Text("\(userCard.name),\(userCard.age)")
                    .font(.system(size: 30, weight: .heavy))
                HStack {
                    Text(userCard.zodiac)
                        .fontWeight(.bold)
                        .padding(5)
                        .background(.white.opacity(0.3))
                        .cornerRadius(5)
                    Text(userCard.place)
                }
            }
            Spacer()
            Button(action: {
                appState.isTabBarHidden = true
            }, label: {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 30))
                    .padding(8)
            })
        }
        .foregroundColor(.white)
        .padding()
        .padding(.bottom, 60)
        .background(
            LinearGradient(colors: [.black.opacity(0.9),.clear], startPoint: .bottom, endPoint: .top)
        )
        .cornerRadius(appState.isTabBarHidden ? 0 : 20)
        .clipped()
    }
    
    
    
    func nextImage() {
        imageIndex = (imageIndex + 1) % userCard.photos.count
    }
    
    func frontImage() {
        imageIndex = (imageIndex - 1 + userCard.photos.count) % userCard.photos.count
    }
}

#Preview {
    UserCardView(userCard: UserCard(name: "name", age: 23, place: "place", zodiac: "zodiac", photos: ["User1","User2"])) {
        //
    }
    .environment(AppState())
}
