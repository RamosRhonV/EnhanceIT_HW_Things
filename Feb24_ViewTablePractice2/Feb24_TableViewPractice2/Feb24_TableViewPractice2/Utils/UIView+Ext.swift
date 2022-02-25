//
//  UIView+Ext.swift
//  Feb24_TableViewPractice2
//
//  Created by Consultant on 2/24/22.
//

import Foundation
import UIKit

extension UIView {
    // helper function to help setup AutoLayout constraints
    // programmatically
    func pin (_ superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
}
