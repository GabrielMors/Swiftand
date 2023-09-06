//
//  TextFieldDefault.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//
import Foundation
import UIKit

class TextFieldDefault: UITextField {
    //MARK:  Contante
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 40)
    
    //MARK: Inits
    init(pleaceholder: String,keyboardType: UIKeyboardType = .default){
        super.init(frame: .zero)
        initDefault(plaeceholder: pleaceholder)
        self.keyboardType = keyboardType
        
    }
    
    init(pleaceholder: String,isSecureTextEntry: Bool){
        super.init(frame: .zero)
        initDefault(plaeceholder: pleaceholder)
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(plaeceholder: String){
        self.backgroundColor = .white
        self.font = UIFont.systemFont(ofSize: 20)
        self.autocorrectionType = .no
        self.layer.cornerRadius = 7
        self.attributedPlaceholder = NSAttributedString(string: plaeceholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: Add Padding in TextField
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
