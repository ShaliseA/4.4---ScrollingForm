//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Shalise Ayromloo on 3/12/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
    }

    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: .UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)),name: .UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
        guard let info = notificiation.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue else { return }
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        let contentInsets = UIEdgeInsets(0.0, 0.0, keyboardSize.height, 0.0)
        UIScrollView.contentInset = contentInsets
        UIScrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification:
        NSNotification) {
        let contentInsets = UIEdgeInsets.zero
    UIScrollView.contentInset = contentInsets
    UIScrollView.scrollIndicatorInsets = contentInsets
    }
  

    
}


