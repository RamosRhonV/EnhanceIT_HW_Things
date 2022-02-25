//
//  ViewController.swift
//  Feb24_TableViewPractice
//
//  Created by Consultant on 2/24/22.
//

import UIKit

class ViewController: UIViewController {

    let vc = TableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onNextTapped(_ sender: Any) {
        vc.groceryList = ["Bingus", "Floppa", "Scoogas", "Gusic", "Gakster", "Blimpus"]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


