//
//  ButtonDefault.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit

class ButtonDefaults: UIButton{
    init(title: String){
        super.init(frame: .zero)
        
        initButton(title: title, font: UIFont.systemFont(ofSize: 20))
    }
    
    init(title: String, font: UIFont){
        super.init(frame: .zero)
        
        initButton(title: title, font: font)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initButton(title: String, font: UIFont){
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
