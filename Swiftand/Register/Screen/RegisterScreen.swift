//
//  RegisterScreen.swift
//  LoginAutentication
//
//  Created by Alexandre Brigolin on 10/09/23.
//

import UIKit
import DSM

enum RegisterStringMagic: String {
    case returnButton = "chevron.backward"
    case titleLabel = "Cadastro"
    case emailLabel = "E-mail"
    case emailTextField = "Digite seu email:"
    case personImageView = "person"
    case passwordLabel = "Senha"
    case passwordTextField = "Digite sua senha:"
    case showPasswordButton = "eye.slash"
    case repeatPasswordLabel = "Confirmação Senha"
    case repeatPasswordTextField = "Confirmar Senha:"
    case registerButton = "Cadastrar"
    case openShowPasswordButton = "eye"
}


protocol RegisterScreenProtocol: AnyObject {
    func actionReturnButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var returnButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: RegisterStringMagic.returnButton.rawValue), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(tappedReturnButton), for: .touchUpInside)
        return button
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = RegisterStringMagic.titleLabel.rawValue
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = RegisterStringMagic.emailLabel.rawValue
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = RegisterStringMagic.emailTextField.rawValue
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.textColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: RegisterStringMagic.personImageView.rawValue)
        image.tintColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        return image
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = RegisterStringMagic.passwordLabel.rawValue
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = RegisterStringMagic.passwordTextField.rawValue
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.textColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        tf.isSecureTextEntry = true
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: RegisterStringMagic.showPasswordButton.rawValue), for: .normal)
        button.tintColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        button.addTarget(self, action: #selector(self.tappedShowPasswordButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = RegisterStringMagic.repeatPasswordLabel.rawValue
        return label
    }()
    
    lazy var repeatPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = RegisterStringMagic.repeatPasswordTextField.rawValue
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.textColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        tf.isSecureTextEntry = true
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var repeatShowPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: RegisterStringMagic.showPasswordButton.rawValue), for: .normal)
        button.tintColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        button.addTarget(self, action: #selector(self.tappedRepeatShowPasswordButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(RegisterStringMagic.registerButton.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        self.delegate?.actionRegisterButton()
    }
    
    @objc func tappedReturnButton(_ sender: UIButton) {
        self.delegate?.actionReturnButton()
    }
    
    @objc func tappedShowPasswordButton(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: RegisterStringMagic.openShowPasswordButton.rawValue), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: RegisterStringMagic.showPasswordButton.rawValue), for: .normal)
        }
    }
    
    @objc func tappedRepeatShowPasswordButton(_ sender: UIButton) {
        if repeatPasswordTextField.isSecureTextEntry == true {
            repeatPasswordTextField.isSecureTextEntry = false
            repeatShowPasswordButton.setImage(UIImage(systemName: RegisterStringMagic.openShowPasswordButton.rawValue), for: .normal)
        } else {
            repeatPasswordTextField.isSecureTextEntry = true
            repeatShowPasswordButton.setImage(UIImage(systemName: RegisterStringMagic.showPasswordButton.rawValue), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
        repeatPasswordTextField.delegate = delegate
    }
    
    private func addElements() {
        addSubview(returnButton)
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        emailTextField.addSubview(personImageView)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        passwordTextField.addSubview(showPasswordButton)
        addSubview(repeatPasswordLabel)
        addSubview(repeatPasswordTextField)
        repeatPasswordTextField.addSubview(repeatShowPasswordButton)
        addSubview(registerButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            returnButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            returnButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
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
            
            repeatPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            repeatPasswordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            repeatPasswordTextField.topAnchor.constraint(equalTo: repeatPasswordLabel.bottomAnchor, constant: 5),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            repeatShowPasswordButton.topAnchor.constraint(equalTo:repeatPasswordTextField.topAnchor, constant: 5),
            repeatShowPasswordButton.trailingAnchor.constraint(equalTo: repeatPasswordTextField.trailingAnchor, constant: -10),
            repeatShowPasswordButton.widthAnchor.constraint(equalToConstant: 30),
            repeatShowPasswordButton.heightAnchor.constraint(equalToConstant: 30),
            
            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
