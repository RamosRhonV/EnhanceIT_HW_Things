//
//  MovieDetailViewController.swift
//  Mar3_MoviesTable
//
//  Created by Consultant on 3/3/22.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieTitleLabel: UILabel!
    @IBOutlet weak var MovieDescriptionLabel: UILabel!
    
    var moviez:Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        configureImage()
    }
    
    func configureLabels() {
        MovieTitleLabel.text = moviez?.title
        MovieDescriptionLabel.text = moviez?.overview
    }
    
    func configureImage() {
        let imageURL = "https://image.tmdb.org/t/p/original" + (moviez?.poster_path ?? "/")
        let imgURL = URL(string: imageURL)
        MovieImage.getImage(from: imgURL!)
    }
}
