//
//  PokeDetailViewController.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/5/22.
//

import Foundation
import UIKit

class PokeDetailViewController: UIViewController {
    
    // creates a detail view of the pokemon when the user taps a cell in the preceding tableview
    @IBOutlet weak var PokeSpriteImage: UIImageView!
    @IBOutlet weak var PokeNameLabel: UILabel!
    @IBOutlet weak var PokeTypeLabel: UILabel!
    @IBOutlet weak var PokemonAbilityOneLabel: UILabel!
    @IBOutlet weak var PokemonAbilityTwoLabel: UILabel!
    @IBOutlet weak var PokemonMovesLabel: UILabel!
    
    var pokemonURL: String?
    var pokemonMoves:String = "Moves: "
    var pokemonMovesAvailable = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemonAttr()
    }
    
    func fetchPokemonAttr () {
        
        // fetches the attributes of the pokemon
        URLSession.shared.getRequest(url: URL(string: pokemonURL ?? "https://pokeapi.co/api/v2/pokemon/1"), decoding: PokemonAttributes.self) { [weak self] result in
            switch result {
            case .success(let attr):
                DispatchQueue.main.async {
                    
                    // fetches the front_default sprite of the pokemon
                    let url = URL(string: attr.sprites.front_default!)
                    if let data = try? Data(contentsOf: url!) {
                        self!.PokeSpriteImage.image = UIImage(data: data)
                    }
                    
                    // fetches the name, type, two abilities, and available moves of the pokemon
                    self!.PokeNameLabel.text = "\(attr.name.capitalized)"
                    self!.PokeTypeLabel.text = "Type: \(attr.types[0].type.name.capitalized)"
                    self!.PokemonAbilityOneLabel.text = "Ability 1: \(attr.abilities[0].ability.name.capitalized)"
                    self!.PokemonAbilityTwoLabel.text = "Ability 2: \(attr.abilities[1].ability.name.capitalized)"
                    self!.pokemonMovesAvailable = attr.moves.count
                    
                    for move in attr.moves {
                        self?.pokemonMoves += ", " + move.move.name
                    }
                    self!.PokemonMovesLabel.text = self!.pokemonMoves
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
