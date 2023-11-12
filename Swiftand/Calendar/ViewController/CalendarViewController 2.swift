//
//  CalendarViewController.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit

class CalendarViewController: UIViewController {

    var screen: CalendarScreen?
    
    override func loadView() {
        screen = CalendarScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
