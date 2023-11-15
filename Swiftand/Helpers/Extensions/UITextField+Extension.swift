//
//  UITextField+Extension.swift
//  Swiftand
//
//  Created by Gabriel Mors  on 15/11/23.
//

import UIKit

extension UITextField {
    func setPadding(_ points: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
