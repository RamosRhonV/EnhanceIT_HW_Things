//
//  CarsDetailView.swift
//  Apr2_CarsWithSwiftUI
//
//  Created by Consultant on 4/2/22.
//

import SwiftUI

struct CarsDetailView: View {
    
    let cars: SomeCars
    
    var body: some View {
        VStack {
            Image(uiImage: cars.image).resizable().aspectRatio(contentMode: .fit)
            Text(cars.name)
            Text("Price: \(cars.price)")
            Spacer()
        }
    }
}
