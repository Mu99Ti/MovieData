//
//  MovieDataTableViewCell.swift
//  MovieData
//
//  Created by Muhamad Talebi on 5/1/23.
//

import UIKit
import Kingfisher

class MovieDataTableViewCell: UITableViewCell {
    
    weak var delegate: ModelDataDelegate?
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Arial", size: 25)
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 20)
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
            labelsStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelsStackView.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor, constant: 20),
            labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            labelsStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -20),
            labelsStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3/5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var reuseIdentifier: String {
        return String.init(describing: self.self)
    }
    // overloading func in swift by setting it optional and give a default value
    func configure(title: String?, posterUrl: URL?, date: String?) {
        titleLabel.text = title
        self.movieImageView.loadImage(posterUrl)
        dateLabel.text = date
    }
    
    func fetchModelData() {
        
        
    }
    
}
    

