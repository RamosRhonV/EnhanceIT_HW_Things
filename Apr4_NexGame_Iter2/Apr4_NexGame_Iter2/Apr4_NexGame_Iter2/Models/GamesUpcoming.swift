
import Foundation

import Foundation

struct GamesUpcoming: Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [Results2]?
    let user_platforms : Bool?

    enum CodingKeys: String, CodingKey {

        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
        case user_platforms = "user_platforms"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        previous = try values.decodeIfPresent(String.self, forKey: .previous)
        results = try values.decodeIfPresent([Results2].self, forKey: .results)
        user_platforms = try values.decodeIfPresent(Bool.self, forKey: .user_platforms)
    }
}

struct Results2: Codable {
    let slug : String?
    let name : String?
    let playtime : Int?
    let platforms : [Platforms2]?
    let stores : [Stores2]?
    let released : String?
    let tba : Bool?
    let background_image : String
    let rating : Double?
    let rating_top : Int?
    let ratings : [Ratings2]?
    let ratings_count : Int?
    let reviews_text_count : Int?
    let added : Int?
    let added_by_status : Added_by_status2?
    let metacritic : Int?
    let suggestions_count : Int?
    let updated : String?
    let id : Int?
    let score : String?
    let clip : String?
    let tags : [Tags2]?
    let esrb_rating : Esrb_rating2?
    let user_game : String?
    let reviews_count : Int?
    let saturated_color : String?
    let dominant_color : String?
    let short_screenshots : [Short_screenshots]?
    let parent_platforms : [Parent_platforms]?
    let genres : [Genres2]?

    enum CodingKeys: String, CodingKey {

        case slug = "slug"
        case name = "name"
        case playtime = "playtime"
        case platforms = "platforms"
        case stores = "stores"
        case released = "released"
        case tba = "tba"
        case background_image = "background_image"
        case rating = "rating"
        case rating_top = "rating_top"
        case ratings = "ratings"
        case ratings_count = "ratings_count"
        case reviews_text_count = "reviews_text_count"
        case added = "added"
        case added_by_status = "added_by_status"
        case metacritic = "metacritic"
        case suggestions_count = "suggestions_count"
        case updated = "updated"
        case id = "id"
        case score = "score"
        case clip = "clip"
        case tags = "tags"
        case esrb_rating = "esrb_rating"
        case user_game = "user_game"
        case reviews_count = "reviews_count"
        case saturated_color = "saturated_color"
        case dominant_color = "dominant_color"
        case short_screenshots = "short_screenshots"
        case parent_platforms = "parent_platforms"
        case genres = "genres"
    }

    /*init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        playtime = try values.decodeIfPresent(Int.self, forKey: .playtime)
        platforms = try values.decodeIfPresent([Platforms2].self, forKey: .platforms)
        stores = try values.decodeIfPresent([Stores2].self, forKey: .stores)
        released = try values.decodeIfPresent(String.self, forKey: .released)
        tba = try values.decodeIfPresent(Bool.self, forKey: .tba)
        //background_image = try values.decodeIfPresent(String.self, forKey: .background_image)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        rating_top = try values.decodeIfPresent(Int.self, forKey: .rating_top)
        ratings = try values.decodeIfPresent([Ratings2].self, forKey: .ratings)
        ratings_count = try values.decodeIfPresent(Int.self, forKey: .ratings_count)
        reviews_text_count = try values.decodeIfPresent(Int.self, forKey: .reviews_text_count)
        added = try values.decodeIfPresent(Int.self, forKey: .added)
        added_by_status = try values.decodeIfPresent(Added_by_status2.self, forKey: .added_by_status)
        metacritic = try values.decodeIfPresent(Int.self, forKey: .metacritic)
        suggestions_count = try values.decodeIfPresent(Int.self, forKey: .suggestions_count)
        updated = try values.decodeIfPresent(String.self, forKey: .updated)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        score = try values.decodeIfPresent(String.self, forKey: .score)
        clip = try values.decodeIfPresent(String.self, forKey: .clip)
        tags = try values.decodeIfPresent([Tags2].self, forKey: .tags)
        esrb_rating = try values.decodeIfPresent(Esrb_rating2.self, forKey: .esrb_rating)
        user_game = try values.decodeIfPresent(String.self, forKey: .user_game)
        reviews_count = try values.decodeIfPresent(Int.self, forKey: .reviews_count)
        saturated_color = try values.decodeIfPresent(String.self, forKey: .saturated_color)
        dominant_color = try values.decodeIfPresent(String.self, forKey: .dominant_color)
        short_screenshots = try values.decodeIfPresent([Short_screenshots].self, forKey: .short_screenshots)
        parent_platforms = try values.decodeIfPresent([Parent_platforms].self, forKey: .parent_platforms)
        genres = try values.decodeIfPresent([Genres2].self, forKey: .genres)
    }*/
}

struct Added_by_status2 : Codable {
    let yet : Int?
    let owned : Int?
    let beaten : Int?
    let toplay : Int?
    let dropped : Int?
    let playing : Int?

    enum CodingKeys: String, CodingKey {

        case yet = "yet"
        case owned = "owned"
        case beaten = "beaten"
        case toplay = "toplay"
        case dropped = "dropped"
        case playing = "playing"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        yet = try values.decodeIfPresent(Int.self, forKey: .yet)
        owned = try values.decodeIfPresent(Int.self, forKey: .owned)
        beaten = try values.decodeIfPresent(Int.self, forKey: .beaten)
        toplay = try values.decodeIfPresent(Int.self, forKey: .toplay)
        dropped = try values.decodeIfPresent(Int.self, forKey: .dropped)
        playing = try values.decodeIfPresent(Int.self, forKey: .playing)
    }
}

struct Esrb_rating2: Codable {
    let id : Int?
    let name : String?
    let slug : String?
    let name_en : String?
    let name_ru : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case slug = "slug"
        case name_en = "name_en"
        case name_ru = "name_ru"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        name_en = try values.decodeIfPresent(String.self, forKey: .name_en)
        name_ru = try values.decodeIfPresent(String.self, forKey: .name_ru)
    }
}

struct Genres2 : Codable {
    let id : Int?
    let name : String?
    let slug : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case slug = "slug"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
    }
}

struct Parent_platforms : Codable {
    let platform : Platform2?

    enum CodingKeys: String, CodingKey {

        case platform = "platform"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        platform = try values.decodeIfPresent(Platform2.self, forKey: .platform)
    }

}


struct Platform2: Codable {
    let id : Int?
    let name : String?
    let slug : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case slug = "slug"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
    }

}


struct Platforms2 : Codable {
    
    let platform : Platform2?

    enum CodingKeys: String, CodingKey {

        case platform = "platform"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        platform = try values.decodeIfPresent(Platform2.self, forKey: .platform)
    }
}

struct Ratings2 : Codable {
    let id : Int?
    let title : String?
    let count : Int?
    let percent : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case count = "count"
        case percent = "percent"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        percent = try values.decodeIfPresent(Double.self, forKey: .percent)
    }
}

struct Short_screenshots : Codable {
    let id : Int?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
}


struct Store2: Codable {
    let id : Int?
    let name : String?
    let slug : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case slug = "slug"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
    }
}

struct Stores2: Codable {
    let store : Store2?

    enum CodingKeys: String, CodingKey {

        case store = "store"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        store = try values.decodeIfPresent(Store2.self, forKey: .store)
    }
}

struct Tags2 : Codable {
    let id : Int?
    let name : String?
    let slug : String?
    let language : String?
    let games_count : Int?
    let image_background : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case slug = "slug"
        case language = "language"
        case games_count = "games_count"
        case image_background = "image_background"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        games_count = try values.decodeIfPresent(Int.self, forKey: .games_count)
        image_background = try values.decodeIfPresent(String.self, forKey: .image_background)
    }
}





