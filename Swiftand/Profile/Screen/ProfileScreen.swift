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
        image.clipsToBounds = true
        image.layer.cornerRadius = image.frame.size.width / 2.0
        image.layer.masksToBounds = true
        image.tintColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        return image
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
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            personImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            personImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 70),
            personImageView.widthAnchor.constraint(equalToConstant: 70),
        
        ])
    }
    
}
