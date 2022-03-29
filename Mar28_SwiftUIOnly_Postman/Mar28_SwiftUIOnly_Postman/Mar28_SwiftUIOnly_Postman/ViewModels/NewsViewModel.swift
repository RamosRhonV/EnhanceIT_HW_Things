//
//  NewsViewModel.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    private(set) var articles = [Article]()
    @Published private(set) var state: ResultStates = .loading
    init(service: NewsService) {
        self.service = service
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    func getArticles() {
        self.state = .loading
        let cancellable = service.request(from: .getNews)
            .sink { result in
                switch result {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            }
    receiveValue: {response in self.articles = response.articles}
        self.cancellable.insert(cancellable)
    }
}
