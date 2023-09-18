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
        screen?.configTextFieldDelegate(delegate: self)
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
    func doLogin() {
        let email: String = screen?.emailTextField.text ?? String.empty
        let password: String = screen?.passwordTextField.text ?? String.empty
        let isValidEmail = String.isValidEmail(email)
        if email == String.empty {
            self.alert?.getAlert(title: Constants.attention, message: Constants.emailEmpty)
        } else if  !isValidEmail(email) {
            self.alert?.getAlert(title: Constants.attention, message: Constants.emailInvalid)
        }else if password == String.empty {
            self.alert?.getAlert(title: Constants.attention, message: Constants.passwordEmpty)
        } else {
            self.auth?.signIn(withEmail: email, password: password, completion: { usuario, error in
                if usuario == nil {
                    self.alert?.getAlert(title: Constants.attention, message: Constants.loginError)
                } else {
                    self.actionEnterButton()
                }
            })
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(screen?.emailTextField){
            screen?.passwordTextField.becomeFirstResponder()
        }else{
            screen?.passwordTextField.resignFirstResponder()
        }
        return textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 0
        }
        
        switch textField {
        case screen?.emailTextField:
            
            if screen?.emailTextField.text == "" {
                self.screen?.emailTextField.layer.borderWidth = 1.5
                self.screen?.emailTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                self.screen?.emailTextField.layer.borderWidth = 0
            }
            
            break
        case screen?.passwordTextField:

            if screen?.passwordTextField.text == "" {
                self.screen?.passwordTextField.layer.borderWidth = 1.5
                self.screen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                self.screen?.passwordTextField.layer.borderWidth = 0
            }
        default:
            break
        }
    }
}

