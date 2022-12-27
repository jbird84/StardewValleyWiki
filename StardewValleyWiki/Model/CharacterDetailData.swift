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
    let heart_events: [String]?
}

// MARK: - Gift
struct Gift: Codable {
    let love: String
    let like: String
    let neutral: String
    let hate: String
}

// MARK: - HeartEvent
struct HeartEvent: Codable {
    let twoHeart, threeHeart, fourHeart, fiveHeart, sixHeart, sevenHeart, eightHeart, nineHeart, tenHeart, elevenHeart, twelveHeart, thirteenHeart, fourteenHeart: String
}



//enum Name: String, Codable {
 //   case alex
//}

