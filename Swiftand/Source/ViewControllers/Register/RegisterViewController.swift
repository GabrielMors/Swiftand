//
//  RegisterViewController.swift
//  Swiftand
//
//  Created by Boris R on 08/09/23.
//

import Foundation
import UIKit

class RegisterViewController: ViewControllerDefault {
//MARK: Clousure
    var onLoginTap: (()-> Void)?
    
//    MARK: Visual Elementos
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.backgroundColor = .gray
        view.onLoginTap = {
            self.onLoginTap?()
        }
        return view
        
    }()
    
    override func loadView() {
        self.view = registerView
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
