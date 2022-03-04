//
//  ViewController.swift
//  Mar3_GenericURLSessions
//
//  Created by Consultant on 3/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var user = [Users]()
    var post = [Posts]()
    var brew = [Brews]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        //fetchUser()
        //fetchPosts()
        fetchBrews()
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    // Result Tupe: Swift's result type is implemented
    // as an enum that has two cases: success & failure
    
    // we can use a specific error type of our own making, such
    // as NetworkError or AuthenticationError, allowing
    // us to have typed throws for the first time in
    // Swift
    
    // but this is not required
    
    // URL
    // https://www.hackingwithswift.com/articles/161/how-to-use-result-in-swift
    // https://www.avenderlee.com/swift/result-enum-type/
    func fetchUser() {
        URLSession.shared.getRequest(url: APIEndpoints.users, decoding: [Users].self) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPosts() {
        URLSession.shared.getRequest(url: APIEndpoints.post, decoding: [Posts].self) { [weak self] result in
            switch result {
            case .success(let post):
                self?.post = post
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchBrews() {
        URLSession.shared.getRequest(url: APIEndpoints.brew, decoding: [Brews].self) { [weak self] result in
            switch result {
            case .success(let brew):
                self?.brew = brew
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brew.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = brew[indexPath.row].name.capitalized
        cell.detailTextLabel?.text = brew[indexPath.row].brewery_type
        return cell
    }
}

