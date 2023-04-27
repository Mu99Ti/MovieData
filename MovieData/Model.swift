//
//  Model.swift
//  MovieData
//
//  Created by Muhamad Talebi on 4/26/23.
//

import UIKit

// URL: https://api.themoviedb.org/3/search/movie?page=1&api_key=852ffe4cfff2346ad60b709d653c5ea3&query=batman

//struct Model: Decodable {
//    
//    var page: Int
//    var results: [ResultModel]
//    var totalPages: Int
//    var totalResults : Int
//    
//    enum CodingKeys: String, CodingKey {
//        case page
//        case results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//extension Model {
//    struct ResultModel: Decodable {
//       
////        var adult: Bool
////        var backdropPath: String?
//        var id: Int
////        var originalLanguage: String?
////        var originalTitle: String?
////        var overView: String?
////        var popularity: Double?
//        var posterPath: String?
//        var releaseDate: String?
//        var title: String?
////        var video: Bool
////        var voteAverage: CGFloat?
////        var voteCount: Int64?
//        
//        
//        var posterImageURL: URL? {
//            let url = URL(string: "https://image.tmdb.org/t/p/w200\(String(describing: posterPath))")
//            return url
//        }
//     
//        enum CodingKeys: String, CodingKey {
////            case backdropPath = "backdrop_path"
//            case id
////            case originalLanguage = "original_language"
////            case originalTitle = "original_title"
////            case overView = "overview"
////            case popularity
//            case posterPath = "poster_path"
//            case releaseDate = "release_date"
//            case title
////            case video
////            case adult
////            case voteAverage = "vote_average"
////            case voteCount = "vote_count"
//        }
//    }
//}
//
//let url = URL(string: "https://api.themoviedb.org/3/search/movie?page=1&api_key=852ffe4cfff2346ad60b709d653c5ea3&query=batman")!
//let request = URLRequest(url: url)
//URLSession.shared.dataTask(with: request) { data, response, error in
//    if let data {
//        do {
//            let decoded = try JSONDecoder().decode(Model.self, from: data)
//            print("The json is successfully decoded:", decoded)
//        } catch {
//            print(String(describing: error))
//        }
//    }
//}.resume()
