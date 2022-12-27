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
    let name: Name
    let schedule: [String]
    let birthday: Birthday
    let gifts: [Gift]
    let heartEvents: [HeartEvent]
}

enum Birthday: String, Codable {
    case spring04
    case spring07
    case spring10
    case spring14
    case spring18
    case spring20
    case spring26
    case spring27
    case summer04
    case summer08
    case summer10
    case summer13
    case summer17
    case summer19
    case summer22
    case summer24
    case summer26
    case fall02
    case fall05
    case fall11
    case fall13
    case fall15
    case fall18
    case fall21
    case fall24
    case winter01
    case winter03
    case winter07
    case winter10
    case winter14
    case winter17
    case winter20
    case winter23
    case winter26
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



enum Name: String, Codable {
    case alex
}

