//
//  AlbumCoverImageView.swift
//  Feb25_TabBarTest
//
//  Created by Consultant on 2/26/22.
//

import UIKit

class AlbumCoverImageView: UIImageView {
    var albumCoverImage = UIImageView()
    
    override init(image: UIImage?) {
        super.init(image: image)
        
        configureImageView()
        configureImageConstraints()
        
        addSubview(albumCoverImage)
        print("cover image view initialized")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func set(_ image: UIImage) {
        albumCoverImage.image = image
    }
    
    func configureImageView() {
        albumCoverImage.clipsToBounds = true
    }
    
    func configureImageConstraints() {
        print("configuring cover image constraints")
        albumCoverImage.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        albumCoverImage.heightAnchor.constraint(equalTo: albumCoverImage.widthAnchor).isActive = true
    }
}


