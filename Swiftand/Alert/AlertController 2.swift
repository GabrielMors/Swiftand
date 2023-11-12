//
//  AlertController.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/10/23.
//

import UIKit

enum TypeImageSelected {
    case camera
    case libary
    case cancel
}

class AlertController: NSObject {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func chooseImage(completion: @escaping (_ option: TypeImageSelected) -> Void){
        let alertController: UIAlertController = UIAlertController(title: "Selecione uma das opções abaixo", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { action in
            completion(.camera)
        }
        
        let libery = UIAlertAction(title: "Biblioteca", style: .default) { action in
            completion(.libary)
        }
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel) { action in
            completion(.cancel)
        }
        
        alertController.addAction(camera)
        alertController.addAction(libery)
        alertController.addAction(cancel)
        controller.present(alertController, animated: true)
    }
    
    func alertInformation(title: String, message: String){
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}

