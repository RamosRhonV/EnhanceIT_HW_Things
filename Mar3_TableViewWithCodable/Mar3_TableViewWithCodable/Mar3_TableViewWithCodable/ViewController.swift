//
//  ViewController.swift
//  Mar3_TableViewWithCodable
//
//  Created by Consultant on 3/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        // Do any additional setup after loading the view.
    }

    func setupDelegates() {
        fetchJson {
            self.tableview.reloadData()
        }
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    // a closure is said to escape a function when the closer is
    // passed as an argument to the function but is called
    // after the function returns
    
    // escaping enclosures outlive the function it was passed
    // into
    func fetchJson(completed: @escaping () -> ()) {
        guard let url = URL(string:"https://api.opendota.com/api/heroStats") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something strange happened.")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error.")
                return
            }
            
            guard data != nil else {
                print("Error: We have no data.")
                return
            }
            
            do {
                self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
                DispatchQueue.main.async {
                    // here we call the closure to indicate this
                    // is where the results of the fetch should be
                    completed()
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = heroes[indexPath.row].name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.hero = heroes[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
}

