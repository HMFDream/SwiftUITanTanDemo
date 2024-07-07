//
//  CardVeiew.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import SwiftUI

struct UserCardView: View {
    var userCard:UserCard
    @State var imageIndex = 0
    @State var offset:CGSize = .zero
    var body: some View {
        GeometryReader(content: { geometry in
            let frameWidth = geometry.size.width
            let frameHeight = geometry.size.height
            Image(userCard.photos[imageIndex])
                .resizable()
                .frame(width: frameWidth,height: frameHeight)
                .cornerRadius(10)
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
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 4)
                        .foregroundColor(imageIndex == i ? .white : .gray.opacity(0.5))
                }
            }
            .padding(.top,10)
            .padding(.horizontal,10)
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
        })
        .offset(offset)
        .scaleEffect(getScaleAmount())
        .rotationEffect(Angle(degrees: getRoationAmount()))
        .gesture(
            DragGesture()
                .onChanged({ value in
                    offset = value.translation
                })
                .onEnded({ value in
                    offset = .zero
                })
        )
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
            .foregroundStyle(color)
            .font(.title)
            .fontWeight(.bold)
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: 5).stroke(color, lineWidth: 3)
            }
            .rotationEffect(.degrees(degree))
    }
    
    
    
    func nextImage() {
        imageIndex = (imageIndex + 1) % userCard.photos.count
    }
    
    func frontImage() {
        imageIndex = (imageIndex - 1 + userCard.photos.count) % userCard.photos.count
    }
}

#Preview {
    UserCardView(userCard: UserCard(name: "ss", age: 23, place: "sdfsd", zodiac: "sdf", photos: ["User1","User2"]))
}
