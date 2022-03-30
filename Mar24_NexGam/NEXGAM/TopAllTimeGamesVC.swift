//
//  TopAllTimeGamesVC.swift
//  NEXGAM
//
//  Created by Consultant on 3/24/22.
//

import Foundation
import UIKit

class TopAllTimeGamesVC: UIViewController {
    
    @IBOutlet weak var TopAllTimeGamesTableView: UITableView!
    var gamesList = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("top all time games view loading")
        
        print("setting up top all time games delegates")
        setupDelegates()
        
        print("fetching all games")
        fetchAllGames()
        
        print("top all time games view load complete")
    }
    
    func setupDelegates() {
        TopAllTimeGamesTableView.delegate = self
        TopAllTimeGamesTableView.dataSource = self
        
        print("top all time games delegates loaded")
    }
    
    // fetches all list of all games from RAWG api
    func fetchAllGames() {
        
        URLSession.shared.getRequest(url: APIEndpoints.gamesEndpoint, decoding: AllGames.self) { [weak self] result in
            switch result {
            case .success(let raw):
                
                // debug line prints entire json into console
                //print(raw)
                
                DispatchQueue.main.async {
                    self?.gamesList += raw.results
                }
                
            case .failure(let error):
                print(error)
            }
        }
        print("fetching all games completed")
    }
}



extension TopAllTimeGamesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TopAllTimeGamesTableView.dequeueReusableCell(withIdentifier: "topAllTimeGamesCell", for: indexPath)
        return cell
    }
}
