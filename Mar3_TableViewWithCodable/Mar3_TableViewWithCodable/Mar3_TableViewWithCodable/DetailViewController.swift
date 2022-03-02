//
//  DetailViewController.swift
//  Mar3_TableViewWithCodable
//
//  Created by Consultant on 3/2/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var HeroImage: UIImageView!
    @IBOutlet weak var HeroName: UILabel!
    @IBOutlet weak var HeroPrimAttr: UILabel!
    @IBOutlet weak var HeroLegs: UILabel!
    @IBOutlet weak var HeroAttackType: UILabel!
    
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HeroName.text = hero?.name
        HeroPrimAttr.text = hero?.primaryAttribute
        HeroLegs.text = "\((hero?.legs)!)"
        HeroAttackType.text = hero?.attackType
        
        let baseURL = "https://api.opendota.com" + (hero?.image)!
        let url = URL(string: baseURL)
        HeroImage.getImage(from:url!)
    }
}
