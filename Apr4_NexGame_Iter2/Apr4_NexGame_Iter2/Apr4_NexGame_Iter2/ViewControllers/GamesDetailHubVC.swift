//
//  GamesDetailHubVC.swift
//  Apr4_NexGame_Iter2
//
//  Created by Consultant on 4/4/22.
//

import Foundation
import UIKit

class GamesDetailHubVC: UIViewController {
    
    @IBOutlet weak var GamesDetailHubCoverImage: LazyLoadImage!
    var gameID = 0
    var imageURLString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("games details screen loading")
        fetchGameDetails()
        
        print("games details screen load complete")
    }
    
    func fetchGameDetails() {
        
        let gameDetailsUrl = URL(string: APIEndpoints.gamesDetailsEndpoint + "\(gameID)?" + APIEndpoints.rawgKey)
        // print(gameDetailsUrl)
        
        URLSession.shared.getRequest(url: gameDetailsUrl, decoding: GamesDetails.self) { [weak self] result in
            switch result {
            case .success(let raw):
                self?.imageURLString = raw.backgroundImage
                
                DispatchQueue.main.async {
                    if let data = try? Data(contentsOf: URL(string: self!.imageURLString)!) {
                        self!.GamesDetailHubCoverImage.image = UIImage(data: data)
                        self!.GamesDetailHubCoverImage.contentMode = .scaleAspectFill
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        print("fetching games details completed")
    }
}
