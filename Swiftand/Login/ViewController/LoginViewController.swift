//
//  ViewController.swift
//  LoginAutentication
//
//  Created by Alexandre Brigolin on 10/09/23.
//

import UIKit
import DSM
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    var alert: Alert?
    var auth: Auth?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
        auth = Auth.auth()
    }

}

extension LoginViewController: LoginScreenProtocol {
    func actionRegisterButton() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    func actionEnterButton() {
        
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
