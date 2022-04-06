//
//  NearbyStoresDetailHubVC.swift
//  Apr4_NexGame_Iter2
//
//  Created by Consultant on 4/5/22.
//

import Foundation
import UIKit

class NearbyStoresDetailHubVC: UIViewController {
    
    @IBOutlet weak var StoresDetailHubCoverImage: LazyLoadImage!
    var storeID = 0
    var imageURLString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("stores details screen loading")
        fetchStoreDetails()
        
        print("stores details screen load complete")
    }
    
    func fetchStoreDetails() {
        
        let storeDetailsUrl = URL(string: APIEndpoints.storesEndpoint + "\(storeID)?" + APIEndpoints.rawgKey)
        
        URLSession.shared.getRequest(url: storeDetailsUrl, decoding: StoresDetails.self) { [weak self] result in
            switch result {
            case .success(let raw):
                self?.imageURLString = raw.image_background!
                
                DispatchQueue.main.async {
                    if let data = try? Data(contentsOf: URL(string: self!.imageURLString)!) {
                        self!.StoresDetailHubCoverImage.image = UIImage(data: data)
                        self!.StoresDetailHubCoverImage.contentMode = .scaleAspectFill
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
        print("fetching stores details completed")
    }
}
