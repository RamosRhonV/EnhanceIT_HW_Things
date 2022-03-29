//
//  NewService.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation
import Combine

// dependency injection is a software design pattern in which
// an object receives other instances it depends on
// it is a commonly used technique that allows reusing code, insert mocked data,
// and simply testing

// Combine is a framework developed for reactive programming

protocol NewsService {
    
    // AnyPublisher is a concrete implementation of Publisher that has no
    // significant properties of its own, and passes through elements and
    // completion values from its upstream publisher
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        return URLSession
            .shared
        //Return a publisher that wraps a url session data task for  a given URL request
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
        
            .mapError{_ in APIError.unknown}
            .flatMap{data, response -> AnyPublisher <NewsResponse, APIError> in
        guard let response = response as?
                HTTPURLResponse else {
            return
            Fail(error: APIError.unknown).eraseToAnyPublisher()
        }
            if (200...299).contains(response.statusCode) {
                let jsonDecoder = JSONDecoder()
                return Just(data)
                    .decode(type: NewsResponse.self, decoder: jsonDecoder)
                    .mapError{_ in APIError.decodingError}
                    .eraseToAnyPublisher()
            } else {
                return Fail(error: APIError.errorCode(response .statusCode)).eraseToAnyPublisher()
                    
            }
        }.eraseToAnyPublisher()
    }
}
