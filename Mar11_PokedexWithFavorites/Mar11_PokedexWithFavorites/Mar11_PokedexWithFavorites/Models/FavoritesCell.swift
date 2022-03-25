//
//  FavoritesCell.swift
//  Mar11_PokedexWithFavorites
//
//  Created by Consultant on 3/11/22.
//

import Foundation
import UIKit

class FavoritesCell: UITableViewCell {
    
    @IBOutlet weak var FavPokemonImg: LazyLoadImage!
    @IBOutlet weak var FavPokemonNameLabel: UILabel!
    @IBOutlet weak var FavPokemonTypeLabel: LazyLoadLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
