//
//  LazyLoadLabel.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/7/22.
//

import Foundation
import UIKit

class LazyLoadLabel: UILabel {
    
    // loads pokemon type
    func loadLabel(fromURL:String) {
        DispatchQueue.global().async {
            URLSession.shared.getRequest(url: URL(string:fromURL), decoding: PokemonAttributes.self) { [weak self] result in
                switch result {
                case .success(let label):
                    DispatchQueue.main.async {
                        self?.text = "Type: " + label.types[0].type.name.capitalized
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
