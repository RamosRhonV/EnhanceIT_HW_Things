//
//  UpcomingGamesVC.swift
//  Apr4_NexGame_Iter2
//
//  Created by Consultant on 4/4/22.
//

import Foundation
import UIKit

class UpcomingGamesVC: UIViewController {
    
    @IBOutlet weak var UpcomingGamesTableView: UITableView!
    var upcomingList = [Results2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Upcoming"
        
        setupDelegates()
        fetchUpcomingGames()
    }
    
    func setupDelegates() {
        UpcomingGamesTableView.delegate = self
        UpcomingGamesTableView.dataSource = self
    }
    
    // fetches all list of all games from RAWG api
    func fetchUpcomingGames() {
        
        URLSession.shared.getRequest(url: APIEndpoints.gamesUpcomingEndpoint, decoding: GamesUpcoming.self) { [weak self] result in
            switch result {
            case .success(let raw):
                
                // debug line prints entire json into console
                //print(raw)
                
                DispatchQueue.main.async {
                    self?.upcomingList += raw.results ?? []
                    self?.UpcomingGamesTableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        print("fetching upcoming games completed")
    }
}

extension UpcomingGamesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UpcomingGamesTableView.dequeueReusableCell(withIdentifier: "upcomingGamesTableViewCell", for: indexPath) as! UpcomingGamesTableViewCell
        
        cell.GameTitleLabel.text = upcomingList[indexPath.row].name ?? "No Name"
        cell.GameGenreLabel.text = upcomingList[indexPath.row].genres?[0].name?.capitalized ?? "No Genre"
        
        let gameCoverImage = URL(string:upcomingList[indexPath.row].background_image)!
        if let imageData = try? Data(contentsOf: gameCoverImage) {
            cell.GameCover.image = UIImage(data: imageData)
        }
        
        cell.GameCover.contentMode = .scaleAspectFill
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
