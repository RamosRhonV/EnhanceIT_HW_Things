//
//  LazyLoadImage.swift
//  NEXGAM
//
//  Created by Consultant on 3/31/22.
//

import Foundation
import UIKit

class LazyLoadImage: UIImageView {
    
    // loads the cover image of the game
    func loadImage(imageURL: URL, placeHolderImage: String) {
        self.image = UIImage(named: placeHolderImage)
        
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
