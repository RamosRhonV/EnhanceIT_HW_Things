//
//  NearbyStoresVC.swift
//  Apr4_NexGame_Iter2
//
//  Created by Consultant on 4/4/22.
//

import Foundation
import UIKit

class NearbyStoresVC: UIViewController {
    
    @IBOutlet weak var NearbyStoresTableView: UITableView!
    var storesList = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Nearby Stores"
    }
}

