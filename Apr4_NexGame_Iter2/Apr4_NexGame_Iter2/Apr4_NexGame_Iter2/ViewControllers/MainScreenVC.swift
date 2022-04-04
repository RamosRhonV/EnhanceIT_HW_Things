//
//  MainScreenVC.swift
//  Apr4_NexGame_Iter2
//
//  Created by Consultant on 4/4/22.
//

import Foundation
import UIKit

class MainScreenVC: UIViewController {
    
    @IBOutlet weak var MainScreenTableView: UITableView!
    var gamesList = [Results]()
    var segueIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("main screen loading")
        
        print("setting up main screen tableview delegates")
        setupDelegates()
        
        print("fetching games")
        fetchAllGames()
        
        print("main screen load complete")
    }
    
    func setupDelegates() {
        MainScreenTableView.delegate = self
        MainScreenTableView.dataSource = self
        print("main screen tableview delegates loaded")
    }
    
    // fetches all list of all games from RAWG api
    func fetchAllGames() {
        
        URLSession.shared.getRequest(url: APIEndpoints.gamesEndpoint, decoding: Games.self) { [weak self] result in
            switch result {
            case .success(let raw):
                
                // debug line prints entire json into console
                //print(raw)
                
                DispatchQueue.main.async {
                    self?.gamesList += raw.results
                    self?.MainScreenTableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        print("fetching all games completed")
    }
}

extension MainScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainScreenTableView.dequeueReusableCell(withIdentifier: "mainScreenTableViewCell", for: indexPath) as! MainScreenTableViewCell
        cell.GameTitleLabel.text = gamesList[indexPath.row].name.capitalized
        cell.GameGenreLabel.text = gamesList[indexPath.row].genres[0].name.capitalized
        
        let gameCoverImage = URL(string:gamesList[indexPath.row].backgroundImage)!
        if let imageData = try? Data(contentsOf: gameCoverImage) {
            cell.GameCover.image = UIImage(data: imageData)
        }
        
        cell.GameCover.contentMode = .scaleAspectFill

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        segueIndex = indexPath.row
        self.performSegue(withIdentifier: "segue_to_gamesDetailHubVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! GamesDetailHubVC
        destination.gameID = gamesList[segueIndex].id
    }
}
