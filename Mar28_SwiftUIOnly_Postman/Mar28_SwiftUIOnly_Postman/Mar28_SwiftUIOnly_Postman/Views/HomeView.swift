//
//  HomeView.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case . failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles())
            case .success(let articles):
                NavigationView {
                    List(articles) {
                        item in ArticleView (article: item)
                    }.navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: viewModel.getArticles)
    }
}
