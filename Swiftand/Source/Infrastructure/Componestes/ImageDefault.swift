//
//  ImageDefault.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit

class ImageDefault: UIImageView{
    
    init(nameImage:String){
        super.init(frame: .zero)
        
        initImage(nameImage: nameImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initImage (nameImage: String){
        self.image = UIImage(systemName: nameImage)
        self.tintColor = UIColor.gray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
