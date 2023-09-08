//
//  RegitreCoordinator.swift
//  Swiftand
//
//  Created by Boris R on 08/09/23.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    let navigationController : UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func stat() {
        let viewController = RegisterViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
