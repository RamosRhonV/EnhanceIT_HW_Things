//
//  TableViewController.swift
//  Feb24_TableViewPractice
//
//  Created by Consultant on 2/24/22.
//

import UIKit

class TableViewController: UITableViewController {

    var groceryList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groceryList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = groceryList[indexPath.row]

        return cell
    }

}
