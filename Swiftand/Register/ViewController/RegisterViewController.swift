//
//  RegisterViewController.swift
//  LoginAutentication
//
//  Created by Alexandre Brigolin on 10/09/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    var alert: Alert?
    var auth: Auth?
    
    override func loadView() {
        self.screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
        auth = Auth.auth()
    }
    
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionRegisterButton() {
        
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""        
        
        self.auth?.createUser(withEmail: email, password: password, completion: { usuario, error in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorreto, tente novamente!")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde!")
                } else {
                    self.alert?.getAlert(title: "Parabéns", message: "Login realizado com sucesso!")
                }
            }
        })
    }
}
