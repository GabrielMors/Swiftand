//
//  ViewControllerDefault.swift
//  Swiftand
//
//  Created by Boris R on 06/09/23.
//

import Foundation
import UIKit

class ViewControllerDefault: UIViewController{
    var alfterHiderKeyborad: (()-> Void)?
    var afterShowKeyboard: ((_ heightKeyboard: CGFloat) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // notifica quando o teclado aparecer
        let _: NSObjectProtocol = NotificationCenter.default.addObserver(forName:
            UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            
            guard let valeu = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            
            self.afterShowKeyboard?(valeu.cgRectValue.height)
        }
        // quando tocar do TextField fora fecha o teclado
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        self.view.addGestureRecognizer(tap)
    }
   @objc
func hideKeyboardByTappingOutside(){
        self.view.endEditing(true)
    
//    TASK: enteder o motivo de nao esta funcionado e corrigir
//        alfterHiderKeyborad()
    }
}
