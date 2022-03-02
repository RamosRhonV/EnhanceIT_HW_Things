//
//  ViewController.swift
//  Mar2_PracticeProject
//
//  Created by Consultant on 3/2/22.
//

import UIKit

// Codable is a type alias for the Encodable and Decodable
// protocols

// when you use Codable as a type or generic constraint,
// it matches asny type that conforms to both protocols
struct Dog: Decodable {
    let message: URL
    let status: String
}

class ViewController: UIViewController {

    let urlString = "https://dog.ceo/api/breeds/image/random"
    @IBOutlet weak var dogImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchImage() {
        print("FETCHING DOG")
        guard let url = URL(string: urlString) else {
            print("Bad URL.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No data available.")
                return
            }
            guard response != nil else {
                print(error?.localizedDescription ?? "No response returned.")
                return
            }
            // if successful this data now needs to be converted
            // into JSON.
            
            // marking our APi response struct Dog:Codable means
            // we will be able to use the JSONDecoder() to
            // decode the response object rather than serializing it with
            // JSONSerialization
            
            do {
                let jsonResponse = try JSONDecoder().decode(Dog.self, from: data)
                DispatchQueue.global().async {
                    // marking the try block as failable
                    if let imageData = try? Data(contentsOf: jsonResponse.message) {
                        // moving to the main thread
                        DispatchQueue.main.async {
                            self.dogImage.image = UIImage(data: imageData)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        print("DOG FETCH")
    }

    @IBAction func fetchPhotoTapped(_ sender: Any) {
        print("GETTING DOG")
        fetchImage()
        print("DOG GOT")
    }
    
}

