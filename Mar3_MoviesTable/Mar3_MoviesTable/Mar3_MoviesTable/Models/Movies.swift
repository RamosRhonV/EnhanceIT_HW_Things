//
//  Movies.swift
//  Mar3_MoviesTable
//
//  Created by Consultant on 3/3/22.
//

import Foundation

struct Movies: Codable {
    let title:String
    let popularity:Float
    let poster_path:String?
    let release_date:String
    let overview:String
}

