//
//  ProfileTableViewCell.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 26/10/23.
//

import UIKit
import CPF_CNPJ_Validator
import TLCustomMask

protocol ProfileTableViewCellProtocol: AnyObject {
    func actionEditButton()
    func actionEditImageButton()
}

class ProfileTableViewCell: UITableViewCell {
    
    var customMaskCpf: TLCustomMask?
    var customMaskData: TLCustomMask?
    var customMaskPhone: TLCustomMask?
    
    weak private var delegate: ProfileTableViewCellProtocol?
    
    public func delegate(delegate: ProfileTableViewCellProtocol){
        self.delegate = delegate
    }
    
    static let identifier: String = "ProfileTableViewCell"
    
    lazy var screen: ProfileTableViewCellScreen = {
        let view = ProfileTableViewCellScreen()
        view.delegate(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configMaskCpf()
        configTextFieldDelegate()
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configMaskCpf() {
        customMaskCpf = TLCustomMask(formattingPattern: "$$$.$$$.$$$-$$")
        customMaskData = TLCustomMask(formattingPattern: "$$/$$/$$$$")
        customMaskPhone = TLCustomMask(formattingPattern: "($$) $ $$$$-$$$$")
    }
    
    private func configTextFieldDelegate() {
        screen.cpfTextField.delegate = self
        screen.dataTextField.delegate = self
        screen.phoneTextField.delegate = self
        screen.positionTextField.delegate = self
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

extension ProfileTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if BooleanValidator().validate(cpf: screen.cpfTextField.text ?? "") {
            print("CPF Validado!")
        }else {
            print("CPF invalido, verifique e tente novamente!")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(screen.cpfTextField){
            screen.dataTextField.becomeFirstResponder()
        } else if textField.isEqual(screen.dataTextField){
            screen.phoneTextField.becomeFirstResponder()
        } else if textField.isEqual(screen.phoneTextField){
            screen.positionTextField.becomeFirstResponder()
        } else if textField.isEqual(screen.positionTextField) {
            screen.addressTextField.becomeFirstResponder()
        } else {
            screen.addressTextField.becomeFirstResponder()
        }
        return textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case screen.cpfTextField:
            if let text: String = customMaskCpf?.formatStringWithRange(range: range, string: string) {
                screen.cpfTextField.text = text
                return false
            } else {
                return true
            }
            
        case screen.dataTextField:
            if let text: String = customMaskData?.formatStringWithRange(range: range, string: string) {
                screen.dataTextField.text = text
                return false
            } else {
                return true
            }
            
        case screen.phoneTextField:
            if let text: String = customMaskPhone?.formatStringWithRange(range: range, string: string) {
                screen.phoneTextField.text = text
                return false
            } else {
                return true
            }

            
        default:
            return true
        }
    }
}

extension ProfileTableViewCell: ProfileScreenProtocol {
    func actionEditButton() {
        delegate?.actionEditButton()
    }
    
    func actionEditImageButton() {
        delegate?.actionEditImageButton()
    }
}
