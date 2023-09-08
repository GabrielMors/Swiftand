//
//  LoginCoordinaitor.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator{
    let navigationController: UINavigationController
    
    init (navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func stat() {
        let viewController = LoginViewController()
        
        viewController.onRegisterTap = {
            self.showRegister()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    private func showRegister(){
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.stat()
    }
}
