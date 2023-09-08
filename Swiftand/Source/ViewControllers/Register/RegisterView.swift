//
//  RegisterView.swift
//  Swiftand
//
//  Created by Boris R on 08/09/23.
//

import Foundation
import UIKit

class RegisterView: UIView{

//MARK: Visual ELements
//    MARK: labelDefault
    let titleRegisterLabel = LabelDefault(text: "Cadastro")
    let emailLabel = LabelDefault(text: "E-mail")
    let passwordLabel = LabelDefault(text: "Senha")
    let repeatSenhaLabel = LabelDefault(text: "Repita sua senha")
    
//    MARK: TextfieldDefault
    let emailTextfield = TextFieldDefault(pleaceholder: "Digite seu e-mail", keyboardType: .emailAddress)
    let passwordTextField = TextFieldDefault(pleaceholder: "Digite sua senha", isSecureTextEntry: true)
    let repeatTexField = TextFieldDefault(pleaceholder: "Digite sua sennha", isSecureTextEntry: true)
    
// MARK: ImageIconDefault
    let imageIconPerson = ImageDefault(nameImage: "person")
    let imageIncoEye = ImageDefault(nameImage: "eye")
    
//    MARK: ButtonDefault
    let buttonRegister = ButtonDefaults(title: "Cadastrar", font: UIFont.systemFont(ofSize: 35, weight: .medium))
    
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
}
