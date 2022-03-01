//
//  AlbumInfoVC.swift
//  Feb25_TabBarTest
//
//  Created by Consultant on 2/26/22.
//

import UIKit

class AlbumInfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImage()
        changeLabels()
    }
    
    @IBOutlet weak var AlbumImage: UIImageView!
    @IBOutlet weak var AlbumTitle: UILabel!
    @IBOutlet weak var AlbumDescription: UILabel!
    
    @IBOutlet weak var AlbumTitleLabel: UILabel!
    @IBOutlet weak var AlbumDescriptionLabel: UILabel!
    
    func changeImage () {
        print("image changed to image of cell \(selectedCell)")
        let albumCover = albums[selectedCell].image
        let resizedCover = albumCover.resized(to: CGSize(width: 250.0, height: 250.0))
        let coverImage = AlbumCoverImageView(image: resizedCover)

        AlbumImage.addSubview(coverImage)
    }
    
    func changeLabels() {
        AlbumTitleLabel.text = albums[selectedCell].title
        AlbumDescriptionLabel.text = albums[selectedCell].description
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
