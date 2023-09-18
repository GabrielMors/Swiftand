//
//  Formater.swift
//  Swiftand
//
//  Created by Lillian Souza Peixoto on 18/09/23.
//

import Foundation

extension String {
    
    static var empty = String()
 
    public func isValidEmail(_ email: String) -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
       }
    
    public func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{6,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
            return passwordTest.evaluate(with: password)
    }
}



