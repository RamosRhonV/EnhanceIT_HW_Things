//
//  PokemonTableViewCell.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/7/22.
//

import Foundation
import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PokemonView: LazyLoadImage!
    @IBOutlet weak var PokemonNameTextLabel: UILabel!
    @IBOutlet weak var PokemonTypeTextLabel: LazyLoadLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
