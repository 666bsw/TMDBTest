//
//  Models.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import Foundation

struct Movies: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let popularity:     Double?
    let voteCount:      Int?
    let video:          Bool?
    let posterPath:     String?
    let id:             Int?
    let adult:          Bool?
    let backdropPath:   String?
    let originalTitle:  String?
    let genreIDS:       [Int]?
    let title:          String?
    let voteAverage:    Double?
    let overview, releaseDate: String?
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    enum CodingKeys: String, CodingKey {
        case popularity, video, id, adult, title, overview
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
