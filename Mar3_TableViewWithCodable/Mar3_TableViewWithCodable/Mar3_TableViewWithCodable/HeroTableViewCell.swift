//
//  HeroTableViewCell.swift
//  Mar3_TableViewWithCodable
//
//  Created by Consultant on 3/9/22.
//

import Foundation
import UIKit

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var HeroNameLabel: UILabel!
    @IBOutlet weak var HeroFavImageView: UIImageView!
    @IBOutlet weak var HeroFavSwitch: UISwitch!
    
    func toggledSwitch(_ sender: UISwitch) {
        updateUI(isOn: sender.isOn)
        UserDefaults.standard.switchIsOn = sender.isOn
    }
    
    func updateUI(isOn: Bool) {
        print("switching")
        HeroFavSwitch.isOn = isOn
    }
}
