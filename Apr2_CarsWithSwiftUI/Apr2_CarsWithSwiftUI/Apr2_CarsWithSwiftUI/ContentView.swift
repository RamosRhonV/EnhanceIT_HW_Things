//
//  ContentView.swift
//  Apr2_CarsWithSwiftUI
//
//  Created by Consultant on 4/2/22.
//

import SwiftUI

struct SomeCars {
    let image:UIImage!
    let name:String
    let price:String
    
}

struct ContentView: View {
    
    var carsList = [
        SomeCars(image: UIImage(named: "2020LamborghiniAventadorSVJRoadster.jpeg"), name:"Lamborghini", price:"100000"),
        SomeCars(image: UIImage(named: "2020MercedesAMGGT63SFourDoor.jpeg"), name:"Mercedes", price:"150000"),
        SomeCars(image: UIImage(named: "2020PorscheTaycanMissionEConcept.jpeg"),name:"Porsch", price:"80000"),
        SomeCars(image: UIImage(named: "2020VolvoPolestar1.jpeg"), name:"Volvo", price:"75000")
        ]
    
    var body: some View {
        NavigationView {
            List(carsList, id: \.name) { car in
                NavigationLink(destination: CarsDetailView(cars: car)) {
                    HStack {
                        Image(uiImage:car.image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                        VStack {
                            Text(car.name)
                            Text("$\(car.price)")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
