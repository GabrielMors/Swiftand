//
//  HomeScreen.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 25/09/23.
//

import UIKit

class HomeScreen: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Bem vindo a tela Home"
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(titleLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
