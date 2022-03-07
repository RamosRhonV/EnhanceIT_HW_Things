//
//  PokemonTableViewCell.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/7/22.
//

import Foundation
import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PokemonSpriteView: LazyLoadImage!
    @IBOutlet weak var PokemonNameLabel: UILabel!
    @IBOutlet weak var PokemonTypeLabel: LazyLoadLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //PokemonTypeLabel.text = "this should not be here"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
