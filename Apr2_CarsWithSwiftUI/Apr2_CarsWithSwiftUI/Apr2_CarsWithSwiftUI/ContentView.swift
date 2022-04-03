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
        SomeCars(image: UIImage(named: "2022-range-rover-106-1634929426.jpg"), name:"Range Rover", price:"100,000 Euros"),
        SomeCars(image: UIImage(named: "2020MercedesAMGGT63SFourDoor.jpeg"), name:"Mercedes", price:"52,000 Euros"),
        SomeCars(image: UIImage(named: "3-audi-e-tron-s-2021-rt-hero-front"),name:"Audi E-Tron Quattro", price:"100,035 Euros"),
        SomeCars(image: UIImage(named: "6-bmw-7-series-750li-2019-fd-hero-front"), name:"BMW 7 Series", price:"62,960 Euros"),
        SomeCars(image: UIImage(named: "1-lexus-ls500h-2018-rt-hero-front_0.jpg"), name: "Lexus LS", price: "72,595 Euros"),
        SomeCars(image: UIImage(named: "10-maserati-quattroport-uk-4222.jpg"), name: "Maseratti Quattroporte", price: "75,735 Euros"),
        SomeCars(image: UIImage(named: "8-audi_q8_0.jpg"), name: "Audi Q8", price: "62,815 Euros"),
        SomeCars(image: UIImage(named: "1-bmw-x7-2019-uk-fd-hero-front_0.jpg"), name: "BMW X7", price: "74,265 Euros"),
        SomeCars(image: UIImage(named: "5-merc_cls.jpg"), name: "Mercedes-Benz CLS", price: "52,230 Euros"),
        SomeCars(image: UIImage(named: "4-audia8tracking.jpg"), name: "Audi A8", price: "69,955 Euros")
        ]
    
    var body: some View {
        NavigationView {
            List(carsList, id: \.name) { car in
                NavigationLink(destination: CarsDetailView(cars: car)) {
                    HStack {
                        Image(uiImage:car.image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text(car.name)
                            Text("\(car.price)")
                        }
                    }
                }
            }.navigationBarTitle(Text("Top Luxury Cars"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
