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
    var storesList = [Result3]()
    var segueIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Stores"
        
        print("nearby stores loading")
        
        setupDelegates()
        fetchNearbyStores()
    }
    
    func setupDelegates() {
        NearbyStoresTableView.delegate = self
        NearbyStoresTableView.dataSource = self
    }
    
    func fetchNearbyStores() {
        
        URLSession.shared.getRequest(url: URL(string: APIEndpoints.storesEndpoint + "?" + APIEndpoints.rawgKey), decoding: Stores.self) { [weak self] result in
            switch result {
            case .success(let raw):
                
                // debug line prints entire json into console
                //print(raw)
                
                DispatchQueue.main.async {
                    self?.storesList += raw.results
                    self?.NearbyStoresTableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        print("fetching all stores completed")
    }
}

extension NearbyStoresVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NearbyStoresTableView.dequeueReusableCell(withIdentifier: "nearbyStoresTableViewCell", for: indexPath) as! NearbyStoresTableViewCell
        
        cell.StoreNameLabel.text = storesList[indexPath.row].name.capitalized
        cell.StoreDomainLabel.text = storesList[indexPath.row].domain
        
        let storeIcon = URL(string: storesList[indexPath.row].imageBackground)!
        if let imageData = try? Data(contentsOf: storeIcon) {
            cell.StoreIconImageView.image = UIImage(data: imageData)
        }
        
        cell.StoreIconImageView.contentMode = .scaleAspectFill
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        segueIndex = indexPath.row
        self.performSegue(withIdentifier: "segue_to_storesDetailHubVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! NearbyStoresDetailHubVC
        destination.storeID = storesList[segueIndex].id + 1
    }
}

