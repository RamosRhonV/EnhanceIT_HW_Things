//
//  FavoritesViewController.swift
//  Mar11_PokedexWithFavorites
//
//  Created by Consultant on 3/11/22.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var FavPokemonTableView: UITableView!
    var favPoke = [Pokemon]()
    var pokeURL:String = ""
    var pokeIndex:Int = 0
    var segueIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        createFav(pokeNum: 0)
    }
    
    func setupDelegates() {
        FavPokemonTableView.dataSource = self
        FavPokemonTableView.delegate = self
    }
    
    func createFav(pokeNum:Int) {
        //print("creating fav")
        //print(pokeNum)
        URLSession.shared.getRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon?offset=\(pokeNum)&limit=1"), decoding: Raw.self) { [weak self] result in
            switch result {
            case .success(let raw):
                //print(raw)
                DispatchQueue.main.async {
                    self?.favPoke += raw.results
                    self?.FavPokemonTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }

    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favPoke.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavPokemonTableView.dequeueReusableCell(withIdentifier: "favPokeCell", for: indexPath) as! FavoritesCell
        
        cell.FavPokemonNameLabel.text = favPoke[0].name
        pokeURL = favPoke[indexPath.row].url
        print(pokeURL)
        
        // gets image for each cell
        pokeIndex = indexPath.row
        let imgURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokeIndex + 1).png")!
        if let data = try? Data(contentsOf: imgURL) {
            cell.FavPokemonImg.image = UIImage(data: data)
        }
        
        //cell.FavPokemonTypeLabel.loadLabel(fromURL: pokeURL)
        
        return cell
    }
    
    // sets the cell height to fully view pokemon image
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // segues to the detail view of the pokemon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        segueIndex = indexPath.row
        self.performSegue(withIdentifier: "favDetailSegue", sender: self)
    }
}
