//
//  ProfileViewModel.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 01/11/23.
//

import UIKit

class ProfileViewModel {

    private var personImage: UIImage?
    
    public func getImage() -> UIImage {
        if let personImage = personImage {
            return personImage
        }else {
            return UIImage(systemName: "camera") ?? UIImage()
        }
    }
    
    public func setImage(image: UIImage) {
        personImage = image
    }
}
