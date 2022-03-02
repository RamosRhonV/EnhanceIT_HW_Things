//
//  ViewController.swift
//  Mar1_BreweryAPI
//
//  Created by Consultant on 3/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var breweries = [Brewery]()
    
    override func viewDidLoad() {
        fetchData()
        setupDelegates()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchData() {
        let session = URLSession.shared
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "No idea what happened here!")")
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Not a valid HTTP URL response")
                return
            }
            
            // response status
            print("Response Status Code: \(httpResponse.statusCode)")
            print("Response Status debugDescription: \(httpResponse.debugDescription)")
            print("Response Status localizedString: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
            
            // parse the result as JSON
            do {
                guard let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) else { return }
                print(jsonData)
                guard let jsonArray = jsonData as? [Any] else { return }
                for brewski in jsonArray {
                    // represents the data as an array of dictionary
                    // pairs
                    guard let breweryDict = brewski as? [String:Any] else { return }
                    // assign properties
                    guard let name = breweryDict["name"] as? String else { return }
                    guard let type = breweryDict["brewery_type"] as? String else { return }
                    guard let city = breweryDict["city"] as? String else { return }
                    guard let state = breweryDict["state"] as? String else { return }
                    
                    /*print(name)
                    print(type)
                    print(city)
                    print(state)
                    print(" ... ")*/
                    
                    self.breweries.append(Brewery(name: name, type: type, city: city, state: state))
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
        task.resume()

    }
}

/*extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = breweries[indexPath.row].name
        cell.detailTextLabel?.text = "\(breweries[indexPath.row].city),\(breweries[indexPath.row].state)"
        return cell
    }*/
    
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = breweries[indexPath.row].name
        cell.detailTextLabel?.text = "\(breweries[indexPath.row].city), \(breweries[indexPath.row].state)"
        
        return cell
    }
}

