//
//  Hero.swift
//  HeroApp
//
//  Created by Yersultan Alkenov on 22.03.2025.
//

import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let images: HeroImages?
    let powerstats: PowerStats?
}

struct HeroImages: Codable {
    let lg: String?
}

struct PowerStats: Codable {
    let intelligence, strength, speed, durability, power, combat: Int?
}
