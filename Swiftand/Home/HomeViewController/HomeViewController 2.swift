//
//  HomeViewController.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 25/09/23.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
