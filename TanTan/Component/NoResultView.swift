//
//  NoResultView.swift
//  TanTan
//
//  Created by hmf on 2024/7/8.
//

import SwiftUI

struct NoResultView: View {
    var body: some View {
        VStack {
            CircleAvator(photo: "User1")
                .padding(.bottom, 20)
            Text("Ops, There's no one left to swipe on! Whey not try editing your filters?")
                .foregroundColor(.gray)
                .padding(.horizontal, 50)
                .padding(.bottom, 10)
            Button(action: {
                
            }, label: {
                Text("Edit Filter!")
                    .frame(width: 300, height: 50)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    NoResultView()
}
