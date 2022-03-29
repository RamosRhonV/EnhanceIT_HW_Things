//
//  ErrorView.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    let error: Error
    let handler: ErrorViewActionHandler
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill").foregroundColor(.gray).font(.system(size: 50, weight: .heavy)).padding(.bottom, 3)
            Text("SCOOGAS'D!!!").foregroundColor(.black).font(.system(size: 30))
            Text(error.localizedDescription).foregroundColor(.gray).font(.system(size: 15)).multilineTextAlignment(.center).padding(.vertical, 3)
            Button(action: {
                handler()
            }, label: {
                Text("Retry!")
            }).padding(.vertical, 12).padding(.horizontal, 30).background(Color.blue).foregroundColor(.white).font(.system(size: 16, weight: heavy)).cornerRadius(10)
        }
    }
}

struct ErrorView_Preview: PreviewProvider {
    static var previews: some View {
        ErrorView(error: <#Error#>, handler: <#ErrorView.ErrorViewActionHandler#>)
    }
}



