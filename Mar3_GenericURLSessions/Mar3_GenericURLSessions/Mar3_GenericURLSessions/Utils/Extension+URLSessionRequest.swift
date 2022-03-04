//
//  Extension+URLSessionRequest.swift
//  Mar3_GenericURLSessions
//
//  Created by Consultant on 3/3/22.
//

import Foundation

// URLS
/*
    https://www.swiftbysundell.com/articles/creating-generic-networking-apis-in-swift/
 
    https://betterprogramming.pub/network-requests-in-swift-using-result-type-and-generics-cfbcea464c1
 */

extension URLSession {
    
    // extends URLSession by adding a generic networking call function that
    // does not need to conern itself about classes.
    
    // the only thing we care about is that we are able to use the Codable
    // protocol with whatever type we pass into the parameters in the
    // function
    
    // we could alternatively make this of type T:Any meaning we could
    // even do the JSONSerialization for example
    func getRequest<T:Codable>(url: URL?, decoding: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        
        guard let url = url else {
            completion(.failure(RequestErrors.badURL))
            return
        }
        
        let task = self.dataTask(with: url) { data, _, error in
            guard data != nil else {
                completion(.failure(RequestErrors.badData))
                return
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(decoding, from: data!)
                completion(.success(jsonResult))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

