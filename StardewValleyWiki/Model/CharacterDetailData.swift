//
//  CharacterDetailData.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/26/22.
//

import Foundation

// MARK: - CharacterDetailData
struct CharacterDetailData: Codable {
    let seasons: [Season]
}

// MARK: - Season
struct Season: Codable {
    let spring, summer, fall, winter: [DetailData]
}

// MARK: - DetailData
struct DetailData: Codable {
    let characters: [Character]
}

// MARK: - Character
struct Character: Codable {
    let name: String
    let schedule: [String]
    let birthday: String
    let gifts: [Gift]
    let heartEvents: [HeartEvent]
}

// MARK: - Gift
struct Gift: Codable {
    let love, like, neutral, hate: String
}

// MARK: - HeartEvent
struct HeartEvent: Codable {
    let the2H, the3H, the4H: String?
    let the5H: String
    let the6H, the7H: String?
    let the8H, the9H, the10H: String
    let the11H, the12H, the13H: The11_H
    let the14H: String
    let the7H1, the7H2, the7H3, the6H1: String?
    let the6H2: String?
    let the3H1: The3H1?
    let the3H2: String?
}

enum The11_H: Codable {
    case empty
    case na
}

enum The3H1: Codable {
    case enterKentSHomeWhileHeAndJodiAreBothThere
    case leaveYourFarmhouseBetween630Am930Am
    case visitTheSaloonBetween7PmAnd11PmOnAMonday
}



//OLD MODEL
//// MARK: - CharacterDetailData
//struct CharacterDetailData: Codable {
//    let seasons: [Season]
//}
//
//// MARK: - Season
//struct Season: Codable {
//    let spring, summer, fall, winter: [DetailData]
//}
//
//// MARK: - DetailData
//struct DetailData: Codable {
//    let characters: [Character]
//}
//
//// MARK: - Character
//struct Character: Codable {
//    let name: String
//    let schedule: [String]
//    let birthday: String
//    let gifts: [Gift]
//    let heart_events: [String]?
//}
//
//// MARK: - Gift
//struct Gift: Codable {
//    let love: String
//    let like: String
//    let neutral: String
//    let hate: String
//}
//
//// MARK: - HeartEvent
//struct HeartEvent: Codable {
//    let twoHeart, threeHeart, fourHeart, fiveHeart, sixHeart, sevenHeart, eightHeart, nineHeart, tenHeart, elevenHeart, twelveHeart, thirteenHeart, fourteenHeart: String
//}



