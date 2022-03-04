//
//  ViewController.swift
//  Mar3_MoviesTable
//
//  Created by Consultant on 3/3/22.
//

import UIKit
var movieData:[Movies] = []

class ViewController: UIViewController {

    @IBOutlet weak var MovieTableView: UITableView!
    var movie = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        fetchMovies()
    }
    
    func setupDelegates() {
        MovieTableView.delegate = self
        MovieTableView.dataSource = self
    }
    
    func fetchMovies() {
        URLSession.shared.getRequest(url: APIEndpoints.movies, decoding: Raw.self) { [weak self] result in
            switch result {
            case .success(let raw):
                self?.movie = raw.results
                movieData = self?.movie ?? []
                DispatchQueue.main.async {
                    self?.MovieTableView.reloadData()
                }
            case .failure(let error):
                print("Bingus'd: \(error)")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // returns count of movies
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    // returns cell that has title as textLabel and its popularity as detailTextLabel
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = movie[indexPath.row].title.capitalized
        cell.detailTextLabel?.text = String(movie[indexPath.row].popularity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toMovieDetailView_segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailViewController {
            destination.moviez = movie[(MovieTableView.indexPathForSelectedRow?.row)!]
        }
    }
}

