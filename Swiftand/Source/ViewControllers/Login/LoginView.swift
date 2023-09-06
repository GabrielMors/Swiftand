//
//  LoginView.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit

class LoginView: UIView{
//  MARK: Elements Visual
    
    //  MARK: LabelDefaults
    let titleScreeLabel = LabelDefault(text: "Entrada")
    let emailLabel = LabelDefault(text: "E-mail")
    let passwordLabel = LabelDefault(text: "Senha")

    // MARK: TextFieldDefaults
    let emailTextField = TextFieldDefault(pleaceholder: "Digite seu e-mail", keyboardType: .emailAddress)
    let passwordTextFild = TextFieldDefault(pleaceholder: "Digite sua senha", isSecureTextEntry: true)
    
    // MARK: ImageDefaults
    let imageLabelPerson = ImageDefault(nameImage: "person")
    let imageLabelEye = ImageDefault(nameImage: "eye")
    
    // MARK: ButtonDefaults
    let buttonRegister = ButtonDefaults(title: "Cadastre-se")
    let buttonEnter = ButtonDefaults(title: "Entrar", font: UIFont.systemFont(ofSize: 35, weight: .medium))
    
    
//MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
            setElementVisual()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementVisual (){
        titleScreeView()
        setEmail()
        setPasswordd()
        setButtons()
    }

    private func titleScreeView(){
        self.addSubview(self.titleScreeLabel)
        
        NSLayoutConstraint.activate([
            titleScreeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            titleScreeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
    }
    
    private func setEmail(){
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.emailTextField.addSubview(imageLabelPerson)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 120),
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 5),
            emailTextField.leftAnchor.constraint(equalTo: self.emailLabel.leftAnchor),
            emailTextField.rightAnchor.constraint(equalTo: self.emailLabel.rightAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            imageLabelPerson.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: -2),
            imageLabelPerson.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            imageLabelPerson.widthAnchor.constraint(equalToConstant: 35),
            imageLabelPerson.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setPasswordd(){
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextFild)
        self.passwordTextFild.addSubview(self.imageLabelEye)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,constant: 40),
            passwordLabel.leftAnchor.constraint(equalTo: self.emailTextField.leftAnchor),
            passwordLabel.rightAnchor.constraint(equalTo: self.emailTextField.rightAnchor),

            passwordTextFild.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 5),
            passwordTextFild.leftAnchor.constraint(equalTo: self.passwordLabel.leftAnchor),
            passwordTextFild.rightAnchor.constraint(equalTo: self.passwordLabel.rightAnchor),
            passwordTextFild.heightAnchor.constraint(equalToConstant: 50),
            
            imageLabelEye.rightAnchor.constraint(equalTo: passwordTextFild.rightAnchor, constant: -2),
            imageLabelEye.centerYAnchor.constraint(equalTo: passwordTextFild.centerYAnchor),
            imageLabelEye.leadingAnchor.constraint(equalTo: imageLabelEye.leadingAnchor, constant: 20),
            imageLabelEye.widthAnchor.constraint(equalToConstant: 40),
            imageLabelEye.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setButtons(){
        self.addSubview(self.buttonRegister)
        self.addSubview(self.buttonEnter)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: self.passwordTextFild.bottomAnchor, constant: 40),
            buttonRegister.leftAnchor.constraint(equalTo: self.passwordLabel.leftAnchor),
            buttonRegister.heightAnchor.constraint(equalToConstant: 45),
            buttonRegister.widthAnchor.constraint(equalToConstant: 120),
            
            buttonEnter.topAnchor.constraint(equalTo: self.buttonRegister.bottomAnchor, constant: 60),
            buttonEnter.leftAnchor.constraint(equalTo: self.buttonRegister.leftAnchor),
            buttonEnter.rightAnchor.constraint(equalTo: self.passwordTextFild.rightAnchor),
            
            
        ])
    }
}
