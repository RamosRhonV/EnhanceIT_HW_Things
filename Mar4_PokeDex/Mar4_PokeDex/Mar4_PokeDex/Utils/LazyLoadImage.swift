//
//  LazyLoadImage.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/7/22.
//

import Foundation
import UIKit

class LazyLoadImage: UIImageView {
    
    // loads the sprite image for each tableview cell that gets initialized
    // the image loaded is the front_default sprite of each pokemon
    func loadImage(imageURL: URL, placeHolderImage:String) {
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
