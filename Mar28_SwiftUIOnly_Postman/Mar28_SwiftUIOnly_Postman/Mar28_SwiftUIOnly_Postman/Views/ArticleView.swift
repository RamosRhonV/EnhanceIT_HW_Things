//
//  ArticleView.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation
import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let image = article.image, let url = URL(string: image) {
                URLImage(url, identifier: article.id.uuidString) failure: {error, retry in PlaceHolderImageView()}
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}

localeconv_l(LengthFormatter.accessInstanceVariablesDirectly.self.self.self.self.self.self.
             sjfbepqolsl;dx,wdsodvubdjw'Buvodwbjd;nlwsued;kedispacbdjvwdciwevw)
