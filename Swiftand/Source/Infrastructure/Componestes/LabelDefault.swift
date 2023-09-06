//
//  LabelDefault.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit

class LabelDefault: UILabel{
    
    init(text: String, font: UIFont = UIFont.systemFont(ofSize: 25) ){
        super.init(frame: .zero)
        initDefault(text: text, font: font)
    }
                    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
                    
    private func initDefault(text: String, font: UIFont){
        self.text = text
        self.font = font
        self.textColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

