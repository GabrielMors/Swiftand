//
//  ProfileViewController.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit
import PhotosUI

class ProfileViewController: UIViewController {

    var screen: ProfileScreen?
    var alert: AlertController?
    var viewModel: ProfileViewModel = ProfileViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    

}

extension ProfileViewController: UITableViewDelegate { }

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell
        cell?.delegate(delegate: self)
        cell?.setupCell(image: viewModel.getImage())
     
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }
}

extension ProfileViewController: ProfileScreenProtocol {
    func actionEditButton() {
        print(#function)
    }
    
    func actionEditImageButton() {
        var configuration = PHPickerConfiguration()
         configuration.selectionLimit = 1
        configuration.filter = .images
         let picker = PHPickerViewController(configuration: configuration)
         picker.delegate = self
         present(picker, animated: true)
    }
}

extension ProfileViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.viewModel.setImage(image: image)
                        self.screen?.tableView.reloadData()
                    }
                }
            }
        }
    }}
