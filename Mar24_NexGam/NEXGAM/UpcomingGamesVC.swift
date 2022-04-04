//
//  UpcomingGamesVC.swift
//  NEXGAM
//
//  Created by Consultant on 3/24/22.
//

import Foundation
import UIKit

class UpcomingGamesVC: UIViewController {
    
    @IBOutlet weak var UpcomingGamesTablewView: UITableView!
    var upcomingGamesList:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("upcoming games loaded")
    }
}
