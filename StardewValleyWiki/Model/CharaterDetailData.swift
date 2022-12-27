//
//  CharaterDetailData.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/26/22.
//

import Foundation

// MARK: - CharaterDetailData
struct CharaterDetailData {
    let seasons: [Season]
}

// MARK: - Season
struct Season {
    let spring, summer, fall, winter: [DetailData]
}

// MARK: - DetailData
struct DetailData {
    let charaters: [Charater]
}

// MARK: - Charater
struct Charater {
    let name: Name
    let schedule: [String]
    let birthday: Birthday
    let gifts: [Gift]
    let heartEvents: [HeartEvent]
}

enum Birthday {
    case summer13
}

// MARK: - Gift
struct Gift {
    let love: Love
    let like: Like
    let neutral: String
    let hate: Hate
}

enum Hate {
    case salmonberryWildHorseradishHollyQuartz
}

enum Like {
    case allUniversalLikesAllEggsExceptVoidEgg
}

enum Love {
    case completeBreakfastSalmonDinner
}

// MARK: - HeartEvent
struct HeartEvent {
    let twoHeart, threeHeart, fourHeart, fiveHeart, sixHeart, sevenHeart, eightHeart, nineHeart, tenHeart, elevenHeart, twelveHeart, thirteenHeart, fourteenHeart: String
}



enum Name {
    case alex
}

