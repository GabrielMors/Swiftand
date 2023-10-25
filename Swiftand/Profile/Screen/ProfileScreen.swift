//
//  ProfileScreen.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit

class ProfileScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Perfil"
        return label
    }()
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "camera")
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = image.frame.size.width / 2
        image.tintColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Alexandre Brigolin"
        return label
    }()
    
    lazy var cpfLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "CPF"
        return label
    }()
    
    lazy var cpfTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu CPF:"
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
    
    lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Data de Nascimento"
        return label
    }()
    
    lazy var dataTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua data de nascimento:"
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
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Telefone"
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu telefone:"
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
    
    lazy var cargoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Ramo de Atuação"
        return label
    }()
    
    lazy var cargoTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite deu CPF:"
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
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(personImageView)
        addSubview(nameLabel)
        addSubview(cpfLabel)
        addSubview(cpfTextField)
        addSubview(dataLabel)
        addSubview(dataTextField)
        addSubview(phoneLabel)
        addSubview(phoneTextField)
        addSubview(cargoLabel)
        addSubview(cargoTextField)

    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            personImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            personImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 80),
            personImageView.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 5),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cpfLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            cpfLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 5),
            cpfTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cpfTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cpfTextField.heightAnchor.constraint(equalToConstant: 30),
            
            dataLabel.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 20),
            dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            dataTextField.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 5),
            dataTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dataTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dataTextField.heightAnchor.constraint(equalToConstant: 30),
            
            phoneLabel.topAnchor.constraint(equalTo: dataTextField.bottomAnchor, constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 5),
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            phoneTextField.heightAnchor.constraint(equalToConstant: 30),
            
            cargoLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            cargoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cargoTextField.topAnchor.constraint(equalTo: cargoLabel.bottomAnchor, constant: 5),
            cargoTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cargoTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cargoTextField.heightAnchor.constraint(equalToConstant: 30),
        
        ])
    }
    
}
