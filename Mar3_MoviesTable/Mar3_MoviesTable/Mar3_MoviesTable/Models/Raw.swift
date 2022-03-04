//
//  Raw.swift
//  Mar3_MoviesTable
//
//  Created by Consultant on 3/3/22.
//

import Foundation

struct Raw: Codable {
    let page:Int
    let results:[Movies]
    let total_pages:Int
    let total_results:Int
}
