//
//  CircleAvator.swift
//  TanTan
//
//  Created by hmf on 2024/7/16.
//

import SwiftUI

struct CircleAvator: View {
    var photo:String
    var size:Double = 100
    var body: some View {
        Image(photo)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .cornerRadius(50)
            .overlay {
                Circle().stroke(.white,lineWidth: 5)
            }
            .shadow(radius: 1)
    }
}

#Preview {
    CircleAvator(photo:"User1")
}
