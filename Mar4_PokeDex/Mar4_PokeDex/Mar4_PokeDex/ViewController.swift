//
//  ViewController.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PokemonTableView: UITableView!
    var pokemon = [Pokemon]()
    var attr = [PokemonAttributes]()
    var pokeTypes = [PokemonTypes]()
    var pokeURL: String = "https://pokeapi.co/api/v2/pokemon/1"
    
    var apiOffset = 0
    var apiLoads = 30
    var pokeIndex = 1
    var segueIndex = 1
    
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        fetchPokemon(apiOffset: apiOffset, apiLoads: apiLoads)
    }
    
    func setupDelegates() {
        PokemonTableView.delegate = self
        PokemonTableView.dataSource = self
    }
    
    func fetchPokemon(apiOffset: Int, apiLoads: Int) {
        URLSession.shared.getRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon?offset=\(apiOffset)&limit=\(apiLoads)"), decoding: Raw.self) { [weak self] result in
            switch result {
            case .success(let raw):
                DispatchQueue.main.async {
                    self?.pokemon += raw.results
                    self?.PokemonTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PokemonTableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as! PokemonTableViewCell
            
        // gets name for each cell
        cell.PokemonNameLabel.text = pokemon[indexPath.row].name.capitalized
        pokeURL = pokemon[indexPath.row].url
        
        // gets image for each cell
        pokeIndex = indexPath.row
        let imgURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokeIndex + 1).png")!
        if let data = try? Data(contentsOf: imgURL) {
            cell.PokemonSpriteView.image = UIImage(data: data)
        }
        
        cell.PokemonTypeLabel.loadLabel(fromURL: pokeURL)
            
        return cell
    }
    
    // sets the cell height to fully view pokemon image
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        segueIndex = indexPath.row
        self.performSegue(withIdentifier: "pokeDetailsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pokeDetailsSegue") {
            let destination = segue.destination as! PokeDetailViewController
            destination.pokemonURL = pokemon[segueIndex].url
        }
    }
    
    func loadData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().async {
                sleep(5)
                
                if(self.pokemon.count + 30 <= 150) {
                    self.apiOffset = self.pokemon.count
                    self.fetchPokemon(apiOffset: self.apiOffset, apiLoads: self.apiLoads)
                } else if(self.pokemon.count == 150) {
                    self.apiLoads = self.pokemon.count
                    self.fetchPokemon(apiOffset: 150, apiLoads: 1)
                    self.isLoading = false
                } else {
                    self.isLoading = false
                }
                DispatchQueue.main.async {
                    self.PokemonTableView.reloadData()
                    self.isLoading = false
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if((offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading && self.pokemon.count <= 150) {
            loadData()
        }
    }
}
