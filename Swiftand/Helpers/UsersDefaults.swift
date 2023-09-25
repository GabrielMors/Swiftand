//
//  UsersDefaults.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 25/09/23.
//

import Foundation

class UtilsUserDefaults {
    
    static func saveUserDefaults(value: Any, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    static func getUserDefaults(key: String) -> Any? {
        let value = UserDefaults.standard.object(forKey: key)
        return value
    }
}
