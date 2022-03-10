//
//  Extension+UserDefaults.swift
//  Mar3_TableViewWithCodable
//
//  Created by Consultant on 3/9/22.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case switchIsOn
    }
    
    var switchIsOn:Bool {
        get {
            bool(forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
    }
}
