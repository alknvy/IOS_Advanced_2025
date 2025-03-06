import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let powerstats: PowerStats
    let appearance: Appearance
    let biography: Biography
    let images: Images
}

struct PowerStats: Codable {
    let intelligence, strength, speed, durability, power, combat: Int
}

struct Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]
}

struct Biography: Codable {
    let fullName, placeOfBirth, firstAppearance, publisher: String?
}

struct Images: Codable {
    let xs, sm, md, lg: String
}
