//
//  PickView.swift
//  TanTan
//
//  Created by hmf on 2024/7/15.
//

import SwiftUI

struct PickView: View {
    var card:UserCard
    var blur:Bool
    var body: some View {
        
        if let photo = card.photos.first {
            ZStack(alignment:.bottomLeading) {
                Image(photo)
                    .resizable()
                    .blur(radius: blur ? 25 : 0)
                Text("\(card.name)\n\(card.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .redacted(reason:  blur ? .placeholder : .invalidated)
            }.cornerRadius(16)
        }
        
        
//        GeometryReader(content: { geometry in
//            Image(card.photos.first!)
//                .resizable()
//                .blur(radius: blur ? 25 : 0)
//        })
    }
}

#Preview {
    PickView( card:  .init(name: "Jame", age: 23, place: "New York", zodiac: "Cancer", photos: ["User1"]), blur: true)
        .frame(width: 200,height: 300)
}
