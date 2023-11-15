//
//  CalendarViewController.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    var screen: CalendarScreen?
    
    override func loadView() {
        screen = CalendarScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextView()
    }
    
    private func configTextView() {
        screen?.configTextViewDelegate(textView: self)
    }
    
}

extension CalendarViewController: UITextViewDelegate {
    func tappedTextViewDelegate() {
        screen?.adjustHeightForTextField()
    }
}
