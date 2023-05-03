//
//  Model.swift
//  MovieData
//
//  Created by Muhamad Talebi on 4/26/23.
//

import UIKit
struct Model: Decodable {
    
    var page: Int
    var results: [ResultModel]
    var totalPages: Int
    var totalResults : Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension Model {
    struct ResultModel: Decodable {
       
        var id: Int
        private var posterPath: String?
        var releaseDate: String?
        var title: String?
        var overView: String?
        
        var posterImageURL: URL? {
            guard let posterPath else { return nil }
            let baseURLPath = "https://image.tmdb.org/t/p/w200"
            return URL(string: baseURLPath + posterPath)
        }
        
        var detailsPosterImageURL: URL? {
            guard let posterPath else { return nil }
            let baseURLPath = "https://image.tmdb.org/t/p/original"
            return URL(string: baseURLPath + posterPath)
        }
     
        enum CodingKeys: String, CodingKey {
            case id
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title
            case overView = "overview"
        }
    }
}


