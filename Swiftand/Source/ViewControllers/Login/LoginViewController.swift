//
//  LoginViewController.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit

class LoginViewController: ViewControllerDefault{
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .gray
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }
    
}
