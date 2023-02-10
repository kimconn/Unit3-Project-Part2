//
//  Poster.swift
//  unit2-project
//
//  Created by Kim Connolly on 2/9/23.
//

import Foundation

struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let poster_path: String
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
}
