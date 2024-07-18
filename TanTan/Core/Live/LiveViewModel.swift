//
//  LiveViewModel.swift
//  TanTan
//
//  Created by hmf on 2024/7/18.
//

import Foundation

@Observable final class LiveViewModel {
    var featureCard:[UserCard] = []
    var nearByCard:[UserCard] = []
    var selectedTab:LiveTitle = .Feature
    init() {
        let card = [
            UserCard(name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"]),
            UserCard(name: "Elisa", age: 19, place: "Central Park NYC", zodiac: "Capricorn", photos: ["User2", "User3"]),
            UserCard(name: "Jasmine", age: 27, place: "Empier State NYC", zodiac: "Aquarius", photos: ["User3", "User4"]),
            UserCard(name: "Zahra", age: 24, place: "Liberty NYC", zodiac: "Pisces", photos: ["User4", "User5"]),
            UserCard(name: "Angelina", age: 18, place: "Empier State NYC", zodiac: "Scorpio", photos: ["User5", "User6"]),
            UserCard(name: "Brittany", age: 25, place: "Time Square NYC", zodiac: "Aries", photos: ["User6", "User1"]),
            UserCard(name: "Natalia", age: 22, place: "Vadalia NYC", zodiac: "Cancer", photos: ["User1", "User2"]),
            UserCard(name: "Elisa", age: 19, place: "Central Park NYC", zodiac: "Capricorn", photos: ["User2", "User3"]),
            UserCard(name: "Jasmine", age: 27, place: "Empier State NYC", zodiac: "Aquarius", photos: ["User3", "User4"]),
            UserCard(name: "Zahra", age: 24, place: "Liberty NYC", zodiac: "Pisces", photos: ["User4", "User5"]),
            UserCard(name: "Angelina", age: 18, place: "Empier State NYC", zodiac: "Scorpio", photos: ["User5", "User6"]),
            UserCard(name: "Brittany", age: 25, place: "Time Square NYC", zodiac: "Aries", photos: ["User6", "User1"])
        ]
        
        featureCard = card
        nearByCard = card
    }
}
