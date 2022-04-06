// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
/*struct StoresDetails: Codable {
    let id: Int
    let name, domain, slug: String
    let gamesCount: Int
    let imageBackground: String
    let welcomeDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name, domain, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case welcomeDescription = "description"
    }
}*/

struct StoresDetails : Codable {
    let id : Int?
    let name : String?
    let domain : String?
    let slug : String?
    let games_count : Int?
    let image_background : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case domain = "domain"
        case slug = "slug"
        case games_count = "games_count"
        case image_background = "image_background"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        domain = try values.decodeIfPresent(String.self, forKey: .domain)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        games_count = try values.decodeIfPresent(Int.self, forKey: .games_count)
        image_background = try values.decodeIfPresent(String.self, forKey: .image_background)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}
