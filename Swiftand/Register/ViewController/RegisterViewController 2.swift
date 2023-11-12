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
        screen?.configTextFieldDelegate(delegate: self)
        alert = Alert(controller: self)
        auth = Auth.auth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionReturnButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        let confirmPassword: String = screen?.repeatPasswordTextField.text ?? String.empty
        let isValidEmail = String.isValidEmail(email)
        let isValidPassword = String.isValidPassword(password)
        
        self.auth?.fetchSignInMethods(forEmail: email, completion: { signInMethods, error in
            if let error = error {
                self.alert?.getAlert(title: Constants.attention, message: Constants.emailAlreadyRegistered)
                return
            }
        })
        self.auth?.createUser(withEmail: email, password: password, completion: { usuario, error in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorreto, tente novamente!")
            } else if !isValidEmail(email) {
                self.alert?.getAlert(title: Constants.attention, message: Constants.emailInvalid)
            } else if !isValidPassword(password) {
                self.alert?.getAlert(title: Constants.attention, message: Constants.passwordInvalid)
            } else if password != confirmPassword{
                self.alert?.getAlert(title: Constants.attention, message: Constants.passwordConfirmError)
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

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.isEqual(screen?.emailTextField){
            screen?.passwordTextField.becomeFirstResponder()
        } else if textField.isEqual(screen?.passwordTextField){
            screen?.repeatPasswordTextField.becomeFirstResponder()
        } else {
            screen?.repeatPasswordTextField.resignFirstResponder()
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
                screen?.emailTextField.layer.borderWidth = 1.5
                screen?.emailTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                screen?.emailTextField.layer.borderWidth = 0
            }
            
            break
        case screen?.passwordTextField:

            if screen?.passwordTextField.text == "" {
                screen?.passwordTextField.layer.borderWidth = 1.5
                screen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                screen?.passwordTextField.layer.borderWidth = 0
            }
            
            break
        case screen?.repeatPasswordTextField:

            if screen?.repeatPasswordTextField.text == "" {
                self.screen?.repeatPasswordTextField.layer.borderWidth = 1.5
                self.screen?.repeatPasswordTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                self.screen?.repeatPasswordTextField.layer.borderWidth = 0
            }
        default:
            break
        }
    }
}
