//
//  LoginViewController.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: ViewControllerDefault{
    var onRegisterTap: (()->Void)?
    
    var auth: Auth?
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .gray
        
        view.onRegisterTap = {
            self.onRegisterTap?()
        }
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
    }
    
}
