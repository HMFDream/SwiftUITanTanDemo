//
//  UserCard.swift
//  TanTan
//
//  Created by hmf on 2024/7/7.
//

import Foundation

struct UserCard:Identifiable {
    var id = UUID()
    let name:String
    let age:Int
    let place:String
    let zodiac: String
    let photos: [String]
}
