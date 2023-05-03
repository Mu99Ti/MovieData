//
//  File.swift
//  MovieData
//
//  Created by Muhamad Talebi on 5/3/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadImage(_ imageURLPath: URL?) {
        self.kf.setImage(with: imageURLPath)
    }
}
