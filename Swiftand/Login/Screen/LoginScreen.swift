//
//  LoginScreen.swift
//  LoginAutentication
//
//  Created by Alexandre Brigolin on 10/09/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionRegisterButton()
    func actionEnterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "E-mail"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu email:"
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.tintColor = .lightGray
        return image
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Password"
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha:"
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mySwitch: UISwitch = {
          let mySwitch = UISwitch()
          mySwitch.translatesAutoresizingMaskIntoConstraints = false
//        mySwitch.tintColor = .lightGray
          return mySwitch
      }()

    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedEnterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        self.delegate?.actionRegisterButton()
    }
    
    @objc func tappedEnterButton(_ sender: UIButton) {
        self.delegate?.actionEnterButton()
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        emailTextField.addSubview(personImageView)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        passwordTextField.addSubview(showPasswordButton)
        addSubview(mySwitch)
        addSubview(registerButton)
        addSubview(enterButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            personImageView.topAnchor.constraint(equalTo:emailTextField.topAnchor, constant: 5),
            personImageView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: -10),
            personImageView.widthAnchor.constraint(equalToConstant: 25),
            personImageView.heightAnchor.constraint(equalToConstant: 25),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            showPasswordButton.topAnchor.constraint(equalTo:passwordTextField.topAnchor, constant: 5),
            showPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10),
            showPasswordButton.widthAnchor.constraint(equalToConstant: 30),
            showPasswordButton.heightAnchor.constraint(equalToConstant: 30),
            
            mySwitch.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            mySwitch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            registerButton.topAnchor.constraint(equalTo: mySwitch.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            enterButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            enterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            enterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            enterButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
