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
        getUserDefaults()
    }
    
    private func getUserDefaults() {
        let valueEmail: String = (UtilsUserDefaults.getUserDefaults(key: "email") as? String) ?? ""
        screen?.emailTextField.text = valueEmail
        let valuePassword: String = (UtilsUserDefaults.getUserDefaults(key: "password") as? String) ?? ""
        screen?.passwordTextField.text = valuePassword
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
                    if self.screen?.mySwitch.isOn ?? false {
                        // salvando email e senha
                        let email: String = self.screen?.emailTextField.text ?? ""
                        let password: String = self.screen?.passwordTextField.text ?? ""
                        UtilsUserDefaults.saveUserDefaults(value: email, key: "email")
                        UtilsUserDefaults.saveUserDefaults(value: password, key: "password")
                    }
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)
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

