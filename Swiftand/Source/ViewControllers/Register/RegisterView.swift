//
//  RegisterView.swift
//  Swiftand
//
//  Created by Boris R on 08/09/23.
//

import Foundation
import UIKit

class RegisterView: UIView{
    var onLoginTap: (()-> Void)?
    
//MARK: Visual ELements
//    MARK: labelDefault
    let titleRegisterLabel = LabelDefault(text: "Cadastro")
    let emailLabel = LabelDefault(text: "E-mail")
    let passwordLabel = LabelDefault(text: "Senha")
    let repeatPasswordLabel = LabelDefault(text: "Repita sua senha")
    
//    MARK: TextfieldDefault
    let emailTextfield = TextFieldDefault(pleaceholder: "Digite seu e-mail", keyboardType: .emailAddress)
    let passwordTextField = TextFieldDefault(pleaceholder: "Digite sua senha", isSecureTextEntry: true)
    let repeatPasswordTexField = TextFieldDefault(pleaceholder: "Digite sua sennha", isSecureTextEntry: true)
    
// MARK: ImageIconDefault
    let imageIconPerson = ImageDefault(nameImage: "person")
    let imageIncoEye = ImageDefault(nameImage: "eye")
    let imageIncoEye2 = ImageDefault(nameImage: "eye")
    
//    MARK: ButtonDefault
    let buttonRegister = ButtonDefaults(title: "Cadastrar", font: UIFont.systemFont(ofSize: 35, weight: .medium))
    
    let buttonBack: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        bt.tintColor = .white
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
 
//MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setElemeVisual()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //
    private func setElemeVisual(){
        titleScreeRegister()
        setEmail()
        setPassWord()
        setRepetPassWord()
        setButtons()
    }
    
    
    private func titleScreeRegister(){
        self.addSubview(self.titleRegisterLabel)
        
        NSLayoutConstraint.activate([
            titleRegisterLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            titleRegisterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    private func setEmail(){
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextfield)
        self.emailTextfield.addSubview(imageIconPerson)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 120),
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            
            emailTextfield.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 5),
            emailTextfield.leftAnchor.constraint(equalTo: self.emailLabel.leftAnchor),
            emailTextfield.rightAnchor.constraint(equalTo: self.emailLabel.rightAnchor),
            emailTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            imageIconPerson.rightAnchor.constraint(equalTo: emailTextfield.rightAnchor, constant: -2),
            imageIconPerson.centerYAnchor.constraint(equalTo: emailTextfield.centerYAnchor),
            imageIconPerson.widthAnchor.constraint(equalToConstant: 35),
            imageIconPerson.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setPassWord(){
        self.addSubview(self.passwordTextField)
        self.addSubview(self.passwordLabel)
        self.passwordTextField.addSubview(self.imageIncoEye)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: self.emailTextfield.bottomAnchor, constant: 40),
            passwordLabel.leftAnchor.constraint(equalTo: self.emailLabel.leftAnchor),
            passwordLabel.rightAnchor.constraint(equalTo: self.emailLabel.rightAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leftAnchor.constraint(equalTo: self.emailTextfield.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: self.emailTextfield.rightAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            imageIncoEye.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -10),
            imageIncoEye.centerYAnchor.constraint(equalTo: self.passwordTextField.centerYAnchor),
            imageIncoEye.leadingAnchor.constraint(equalTo: self.imageIncoEye.leadingAnchor, constant: 20),
            imageIncoEye.widthAnchor.constraint(equalToConstant: 40),
            imageIncoEye.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setRepetPassWord(){
        self.addSubview(self.repeatPasswordTexField)
        self.addSubview(self.repeatPasswordLabel)
        self.repeatPasswordTexField.addSubview(self.imageIncoEye2)

        NSLayoutConstraint.activate([
            repeatPasswordLabel.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            repeatPasswordLabel.leftAnchor.constraint(equalTo: self.passwordLabel.leftAnchor),
            repeatPasswordLabel.rightAnchor.constraint(equalTo: self.passwordLabel.rightAnchor),
            
            repeatPasswordTexField.topAnchor.constraint(equalTo: self.repeatPasswordLabel.bottomAnchor, constant: 5),
            repeatPasswordTexField.leftAnchor.constraint(equalTo: self.emailTextfield.leftAnchor),
            repeatPasswordTexField.rightAnchor.constraint(equalTo: self.emailTextfield.rightAnchor),
            repeatPasswordTexField.heightAnchor.constraint(equalToConstant: 50),
            
            imageIncoEye2.rightAnchor.constraint(equalTo: repeatPasswordTexField.rightAnchor, constant: -10),
            imageIncoEye2.centerYAnchor.constraint(equalTo: self.repeatPasswordTexField.centerYAnchor),
            imageIncoEye2.leadingAnchor.constraint(equalTo: self.imageIncoEye2.leadingAnchor, constant: 20),
            imageIncoEye2.widthAnchor.constraint(equalToConstant: 40),
            imageIncoEye2.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setButtons(){
        self.addSubview(self.buttonBack)
        self.addSubview(self.buttonRegister)
        
//        MARK: add acao de voltar para tela de login
        buttonBack.addTarget(self, action: #selector(buttonloginTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonBack.centerYAnchor.constraint(equalTo: self.titleRegisterLabel.centerYAnchor),
            buttonBack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            buttonBack.heightAnchor.constraint(equalToConstant: 50),

            buttonRegister.topAnchor.constraint(equalTo: self.repeatPasswordTexField.bottomAnchor, constant: 70),
            buttonRegister.leftAnchor.constraint(equalTo: self.repeatPasswordTexField.leftAnchor),
            buttonRegister.rightAnchor.constraint(equalTo: self.repeatPasswordTexField.rightAnchor),
        ])
    }

    
    
    @objc
    func buttonloginTap(){
        self.onLoginTap?()
    }
}
