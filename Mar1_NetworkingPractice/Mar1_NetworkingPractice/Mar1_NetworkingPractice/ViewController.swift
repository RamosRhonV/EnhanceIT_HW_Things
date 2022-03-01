//
//  ViewController.swift
//  Mar1_NetworkingPractice
//
//  Created by Consultant on 3/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // fetchPosts()
        // requestPOST()
        fetchUsers()
    }
    
    // make POST request
    func requestPOST() {
        print("executing POST request...")
        let params = [
            "title": "Week 3 Day 2",
            "body": "Making network requests using URLSession"
        ]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonData!)
            }
            
            // in order to update UI with returning data we must move from background
            // thread back to the main thread
            DispatchQueue.main.async {
                self.view.backgroundColor = .cyan
            }
            
        }.resume()
        
        print("finished POST request")
    }
    
    // make request with URLSessionDataTask
    func fetchPosts() {
        print("fetching posts")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        /* for basic requests, the URLSession class provides
         * a shared singleton object that gives you a
         * reasonable default behavior for creating tasks.
         * use the shared.session to fetch the contents of a
         * URL to memory with just a few lines of code.
         */
        
        // MARK: URLSession
        
        /*
         * the URLSession.shared line is a reference to a shared
         * URLSessions instance that has no configuration. it's
         * more limited than a session that's initialized with a
         * URLSessionConfiguration object.
         * this is ok for now.
         */
        
        /*
         * you can construct URLs and access their parts. for URLs
         * that represent local files, you can also manipulate
         * properties of those files directly, such as changing
         * the file's last modification date. finally, you can pass
         * URLs to other APIs to retrieve contents of those URLs.
         */
        
        /*
         * for example, you can use URlSession and its related classes
         * to access the contents of remote resoureces
         */
        
        let task  = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                do {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: [])
                
                // reads json data as a string
                print("Response: \(String(describing: jsonData))")
                } catch {
                    print(error)
                }
            }
        }
        
        task.resume()
        print("finished fetching posts")
    }
    
    // fetch user data
    func fetchUsers() {
        print("fetching users")
        guard let url = URL(string: "https://gist.githubusercontent.com/reinder42/932d7671859959f6363b4d9b4e18bb91/raw/306631d79a5166bb0d86b12ac7d8cc42fecb996e/users.json") else { return }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: [])
                    print("Response: \(String(describing: jsonData))")
                } catch {
                    print(error)
                }
            }
        }
        
        task.resume()
        print("finished fetching users")
    }
}

