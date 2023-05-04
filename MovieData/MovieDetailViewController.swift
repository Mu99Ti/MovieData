//
//  MovieDetailViewController.swift
//  MovieData
//
//  Created by Muhamad Talebi on 5/1/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    private let movie: Model.ResultModel
    
    private lazy var detailsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Bold", size: 40)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var movieDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 20)
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    init(movie: Model.ResultModel) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        configureDetailViewController()
        
        self.title = "Movie Detail"
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Arial Bold", size: 25) as Any]
        
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(detailsScrollView)
        
        detailsScrollView.addSubview(detailsStackView)
        
        detailsStackView.addArrangedSubview(movieDetailImageView)
        detailsStackView.addArrangedSubview(titleLabel)
        detailsStackView.addArrangedSubview(detailsLabel)
        
        NSLayoutConstraint.activate([
            detailsScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: detailsScrollView.topAnchor, constant: 20),
            detailsStackView.leadingAnchor.constraint(equalTo: detailsScrollView.leadingAnchor),
            detailsStackView.bottomAnchor.constraint(equalTo: detailsScrollView.bottomAnchor),
            detailsStackView.trailingAnchor.constraint(equalTo: detailsScrollView.trailingAnchor),
            detailsStackView.widthAnchor.constraint(equalTo: detailsScrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

extension MovieDetailViewController {
    private func configureDetailViewController() {
        
        self.detailsLabel.text = movie.overView
        self.movieDetailImageView.loadImage(movie.detailsPosterImageURL)
        self.titleLabel.text = movie.title
    }
}
