//
//  Model.swift
//  MovieData
//
//  Created by Muhamad Talebi on 4/26/23.
//

import Foundation

struct Model: Decodable {
    
    var page: String?
    var results: [ResultModel]?
    var totalPages: String?
    var totalResults : String?
    
    enum AdditionalKeysInfo: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension Model {
    struct ResultModel: Decodable {
       
        var adult: String?
        var backdropPath: String?
        var id: Int?
        var originalLanguage: Language?
        var originalTitle: String?
        var overView: String?
        var popularity: String?
        var posterPath: String?
        var releaseDate: String?
        var title: String?
        var video: Bool
        var voteAverage: CGFloat?
        var voteCount: Int64?
        
        
        var posterImageURL: URL? {
            let url = URL(string: "https://image.tmdb.org/t/p/w200\(String(describing: posterPath))")
                return url
        }
     
        enum AdditionalResultKeysInfo: String, CodingKey {
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
    
}

extension Model {
    enum Language: String, Decodable {
        case english = "en"
        case persian = "fa"
    }
}

