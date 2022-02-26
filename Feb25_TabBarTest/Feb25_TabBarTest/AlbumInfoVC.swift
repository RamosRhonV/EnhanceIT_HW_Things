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
        let newImage = UIImageView(image: albumCover)
        newImage.contentMode = UIImageView.ContentMode.scaleAspectFit
        AlbumImage.addSubview(newImage)
    }
    
    func changeLabels() {
        AlbumTitleLabel.text = albums[selectedCell].title
        AlbumDescriptionLabel.text = albums[selectedCell].description
    }
    
    

}
