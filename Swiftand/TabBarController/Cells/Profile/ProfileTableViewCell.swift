//
//  ProfileTableViewCell.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 26/10/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier: String = "ProfileTableViewCell"
    
    lazy var screen: ProfileTableViewCellScreen = {
        let view = ProfileTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func delegate(delegate: ProfileScreenProtocol) {
        screen.delegate(delegate: delegate)
    }
    
    private func addSubView() {
        self.contentView.addSubview(screen)
    }
    
    public func setupCell(image: UIImage?) {
        screen.personImageView.image = image
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

}
