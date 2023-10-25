//
//  ProfileViewController.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit

class ProfileViewController: UIViewController {

    var screen: ProfileScreen?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   

}
