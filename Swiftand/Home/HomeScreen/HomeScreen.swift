//
//  HomeScreen.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 25/09/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Bem vindo a tela Home"
        return label
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "        Pesquisar"
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
    
    lazy var magnifyingImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        return image
    }()
    
    lazy var phoneButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        button.tintColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(menuButton)
        addSubview(titleLabel)
        addSubview(searchTextField)
        searchTextField.addSubview(magnifyingImageView)
        searchTextField.addSubview(phoneButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            menuButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            menuButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            menuButton.widthAnchor.constraint(equalToConstant: 25),
            menuButton.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: menuButton.topAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            magnifyingImageView.topAnchor.constraint(equalTo:searchTextField.topAnchor, constant: 5),
            magnifyingImageView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 5),
            magnifyingImageView.heightAnchor.constraint(equalToConstant: 30),
            magnifyingImageView.widthAnchor.constraint(equalToConstant: 30),
            
            phoneButton.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 5),
            phoneButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -5),
            phoneButton.heightAnchor.constraint(equalToConstant: 30),
            phoneButton.widthAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
