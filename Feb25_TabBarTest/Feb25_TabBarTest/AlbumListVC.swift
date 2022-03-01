//
//  AlbumListVC.swift
//  Feb25_CuratedMusicList1
//
//  Created by Consultant on 2/25/22.
//

import UIKit
var selectedCell = 0
var albums: [Album] = []

class AlbumListVC: UIViewController {
    var tableView = UITableView()
    let albumCell = "albumCell"
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        
        configureTableView()
        setTableViewDelegates()
        albums = fetchData()
        
        super.viewDidLoad()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 120
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: albumCell)
        tableView.pin(view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AlbumListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: albumCell) as! AlbumTableViewCell
        let album = albums[indexPath.row]
        cell.set(album)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = indexPath[1]
        self.performSegue(withIdentifier: "toAlbumInfoVC", sender: self)
    }
}

extension AlbumListVC {
    func fetchData() -> [Album] {
        let albums = [
            Album(image: Images.sk1, title: "Skrunko 1", description: "A perfect beginning. It wonderfully encapsulates the beauty of wonder and discovery for young listeners."),
            Album(image: Images.sk2, title: "Skrunko 2", description: "A perfect sequel. It wonderfully encapsulates the ongoing struggle of failure and success, leaving the listener satisfied with song."),
            Album(image: Images.sk3, title: "Skrunko Endgame", description: "A perfect ending. It wonderfully encapsulates the finality of victory, leaving the user with a sense of open direction."),
            Album(image: Images.sk4, title: "Skrunkos", description: "An amazing spin-off. While not as exciting as the original trilogy, it still maintains the familiar charm of Skrunko."),
            Album(image: Images.sk5, title: "Skrinki", description: "An astounding reboot. A surprising reprisal of the Skrunko series; it breathes new life into an antiquated franchise."),
            Album(image: Images.sk6, title: "Bingus", description: "A cute cat. It longs for affection. Please provide some post-haste!"),
            Album(image: Images.sk7, title: "Floppa", description: "A sinister entity. Do not be fooled by its promises. Ensure both your thoughts and desires are untainted."),
            Album(image: Images.sk8, title: "Gakster", description: "A mischievious kitty. Keep a list of your belongings as you travel through its abode. It will almost always steal a portion of it."),
            Album(image: Images.sk9, title: "Gusic", description: "A bountiful warrior. They have scoured the globe for fights and arenas. Lavish in its strength, for it will happily teach it."),
            Album(image: Images.sk10, title: "Scoogas", description: "A foolish jester. Empty laughter meets its jokes. Join in its cursed tomfoolery... or simply ignore it.")
        ]
        
        return albums
    }
}
