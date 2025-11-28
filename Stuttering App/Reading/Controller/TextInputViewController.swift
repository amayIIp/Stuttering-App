//
//  TextInputViewController.swift
//  Stuttering App
//
//  Created by sdc - user on 27/11/25.
//

import UIKit

class TextInputViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var onDoneButtonTapped: ((String) -> Void)? // This closure will pass the text *back* to the TableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Enter Custom Text"

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapClose))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .prominent, target: self, action: #selector(didTapDone))
        
        textView.becomeFirstResponder() // Automatically show the keyboard
    }
    
    @objc func didTapClose() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapDone() {
        
        self.dismiss(animated: true) {
            let enteredText = self.textView.text ?? ""
            self.onDoneButtonTapped?(enteredText)
        }
    }

}
