//
//  ViewController.swift
//  MovieData
//
//  Created by Muhamad Talebi on 4/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ViewController.Cell.self, forCellReuseIdentifier: ViewController.Cell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        navigationItem.titleView = searchBar
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func fetchMovies(_ keyword: String) {
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?page=1&api_key=852ffe4cfff2346ad60b709d653c5ea3&query=\(keyword)")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                do {
                    let decoded = try JSONDecoder().decode(Model.self, from: data)
                    print("The json is successfully decoded:", decoded)
                } catch {
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var keyword = searchBar.searchTextField.text
        if let keyword {
            fetchMovies(keyword)
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.Cell.reuseIdentifier, for: indexPath)
        return cell
    }
    
    
}

extension ViewController {
    class Cell: UITableViewCell {
        
        private lazy var labelsStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillProportionally
            return stackView
        }()
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "teدمنپدکپنمپمنskjk;jkjjlkl;klklt"
            label.numberOfLines = 0
            label.font = UIFont(name: "Arial", size: 30)
            return label
        }()
        
        private lazy var dateLabel: UILabel = {
            let label = UILabel()
            label.text = "teتنتkjljljklohhhlhjkhjlkhjlhjllhjjlljjklkljjklنمتمنتمننمپدمننمتنممst"
            label.numberOfLines = 1
            return label
        }()
        
        
        private lazy var movieImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "popcorn.fill")
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(labelsStackView)
            contentView.addSubview(movieImageView)
            
            labelsStackView.addArrangedSubview(titleLabel)
            labelsStackView.addArrangedSubview(dateLabel)
            
            // top and leading positive, bottom trailing negative
            NSLayoutConstraint.activate([
                labelsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                labelsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                labelsStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor)
            ])
            
            NSLayoutConstraint.activate([
                movieImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                movieImageView.trailingAnchor.constraint(equalTo: labelsStackView.leadingAnchor),
                movieImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                movieImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                movieImageView.widthAnchor.constraint(equalToConstant: 100)
            ])
            
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        static var reuseIdentifier: String {
            return String.init(describing: self.self)
        }
        
        func configure(title: String, image: UIImage, date: String) {
            titleLabel.text = title
            movieImageView.image = image
            dateLabel.text = date
        }
        
    }
}

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
       
//        var adult: Bool
//        var backdropPath: String?
        var id: Int
//        var originalLanguage: String?
//        var originalTitle: String?
//        var overView: String?
//        var popularity: Double?
        var posterPath: String?
        var releaseDate: String?
        var title: String?
//        var video: Bool
//        var voteAverage: CGFloat?
//        var voteCount: Int64?
        
        
        var posterImageURL: URL? {
            let url = URL(string: "https://image.tmdb.org/t/p/w200\(String(describing: posterPath))")
            return url
        }
     
        enum CodingKeys: String, CodingKey {
//            case backdropPath = "backdrop_path"
            case id
//            case originalLanguage = "original_language"
//            case originalTitle = "original_title"
//            case overView = "overview"
//            case popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title
//            case video
//            case adult
//            case voteAverage = "vote_average"
//            case voteCount = "vote_count"
        }
    }
}


