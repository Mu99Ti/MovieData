//
//  Model.swift
//  MovieData
//
//  Created by Muhamad Talebi on 4/26/23.
//

import Foundation

struct Model: Codable {
    
    var page: String
    var results: String
    var totalPages: String
    var totalResults : String
    
    
    enum AdditionalKeysInfo: String, CodingKey {
        
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case backdropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overView = "overview"
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
}

extension Model {
    struct Results {
       
        var adult: String
        var backdropPath: String
        var id: Int
        var originalLanguage: Language
        var originalTitle: String
        var overView: String
        var popularity: String
        var posterPath: String
        var releaseDate: String
        var title: String
        var video: Bool
        var voteAverage: CGFloat
        var voteCount: CLong
        
        
        var posterImageURL: URL? {
            let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)")
                return url
        }
        
    }
    
}

extension Model {
    enum Language: String {
        
        case english = "en"
        case persian = "fa"
    }
}

