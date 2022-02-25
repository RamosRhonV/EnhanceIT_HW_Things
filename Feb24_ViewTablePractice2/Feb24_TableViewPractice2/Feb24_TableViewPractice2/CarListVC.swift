//
//  CarListVC.swift
//  Feb24_TableViewPractice2
//
//  Created by Consultant on 2/24/22.
//

import UIKit

class CarListVC: UIViewController {
    var tableView = UITableView()
    var cars: [Car] = []
    let carCell = "carCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        title = "Top Exotic Cars"
        
        configureTableView()
        setTableViewDelegates()
        cars = fetchData()
    }
    
    func configureTableView () {
        // adds the table view to VC
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: carCell)
        tableView.pin(view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CarListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: carCell) as! CarTableViewCell
        let car = cars[indexPath.row]
        cell.set(car)
        
        return cell
    }
}

extension CarListVC {
    func fetchData() -> [Car] {
        let cars = [
            Car(image: Images.astonMartin, title: "Atons Mratin"),
            Car(image: Images.audi, title: "Audacity"),
            Car(image: Images.bentley, title: "Bety"),
            Car(image: Images.bugatti, title: "Bugait"),
            Car(image: Images.ferrari, title: "Ferret"),
            Car(image: Images.lamborghini, title: "Spaghetti"),
            Car(image: Images.mercedes, title: "Mario"),
            Car(image: Images.porsche, title: "Poor"),
            Car(image: Images.volvo, title: "Valve")
            ]
        return cars
    }
}
