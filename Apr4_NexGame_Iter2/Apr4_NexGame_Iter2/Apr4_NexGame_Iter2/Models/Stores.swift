// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Stores: Codable {
    let count: Int
    let next, previous: JSONNull3?
    let results: [Result3]
}

// MARK: - Result
struct Result3: Codable {
    let id: Int
    let name, domain, slug: String
    let gamesCount: Int
    let imageBackground: String
    let games: [Game]

    enum CodingKeys: String, CodingKey {
        case id, name, domain, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case games
    }
}

// MARK: - Game
struct Game: Codable {
    let id: Int
    let slug, name: String
    let added: Int
}

// MARK: - Encode/decode helpers

class JSONNull3: Codable, Hashable {

    public static func == (lhs: JSONNull3, rhs: JSONNull3) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull3.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
