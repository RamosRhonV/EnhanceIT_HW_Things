//
//  ViewController.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PokemonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }

    func setupDelegates() {
        PokemonTableView.delegate = self
        PokemonTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
