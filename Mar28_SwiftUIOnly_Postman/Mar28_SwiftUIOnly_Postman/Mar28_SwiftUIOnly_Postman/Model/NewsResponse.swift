//
//  NewResponse.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [Article]
}

// in order to work with the swiftUI equivalent of UIKIT tableviews we
// will be using a list. each element in a swiftUI list must be unique,
// in order to have unique identifiers we are using UUID

struct Article: Decodable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    
    // transforms the date string into a date object
    /*let testDate = "2022-03-28T15:56:00Z"
    let dFormat = DateFormatter()
    let tDate = dFormat.date(from: testDate)*/
    
    static var dummyData: Article {
        .init(author: "Yaroslav Trofimov and Max Colchester", url: "Yaroslav Trofimov and Max Colchester", source: "The Wall Street Journal", title: "Roman Abramovich and Ukrainian Peace Negotiators Suffer Suspected Poisoning - The Wall Street Journal", articleDescription: "The Russian oligarch and at least two senior members of the Ukrainian team developed symptoms that they blamed on hard-liners in Moscow who they said wanted to sabotage talks to end the war.", image: "https://images.wsj.net/im-513381/social", date: Date())
    }
}
    
