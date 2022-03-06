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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        fetchPokemon()
    }
    
    func setupDelegates() {
        PokemonTableView.delegate = self
        PokemonTableView.dataSource = self
    }
    
    func fetchPokemon() {
        URLSession.shared.getRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10"), decoding: Raw.self) { [weak self] result in
            switch result {
            case .success(let raw):
                self?.pokemon = raw.results
                DispatchQueue.main.async {
                    self?.PokemonTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /*func fetchPokemonType(url:String) {
        let urlStr = URL(string: url)
        URLSession.shared.getRequest(url: urlStr, decoding: PokemonAttributes.self) { [weak self] result in
            switch result {
            case .success(let attr):
                print(attr.types)
                self?.pokeTypes = attr.types
                self?.pokemonType = self?.pokeTypes[0].type.name ?? " "
                print(self?.pokemonType ?? " ")
                DispatchQueue.main.async {
                    self?.PokemonTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }*/
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PokemonTableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath)
        
        cell.textLabel?.text = pokemon[indexPath.row].name.capitalized
        cell.detailTextLabel?.text = pokemon[indexPath.row].url
        return cell
    }
}
