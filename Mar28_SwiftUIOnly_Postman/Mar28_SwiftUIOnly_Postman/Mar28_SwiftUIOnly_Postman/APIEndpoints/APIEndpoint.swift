//
//  APIEndpoint.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation

/*
 * in order to make our code more reusable we ar egoing to build
 * our request using a protocal. this will allow us to add other
 * requests that can reuse this blueprint for making a GET request
 */

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

// we can add cases the app grows to get reviews, update video for example
enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        
        /*
         * this  block of code performs a file system operation
         * to determine if the path component is a directory.
         * if so it will append a trailing /.
         * if the use rknows in advance that the path component is a
         * directory or not then use appendingpathcomponent
         */
        
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
}
