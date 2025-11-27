//
//  TextInputViewController.swift
//  Stuttering App
//
//  Created by sdc - user on 27/11/25.
//

import UIKit

class TextInputViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    // 2. This closure will pass the text *back* to the TableViewController
    var onDoneButtonTapped: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Enter Custom Text"

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapClose))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .prominent, target: self, action: #selector(didTapDone))
        
        // 4. Automatically show the keyboard
        textView.becomeFirstResponder()
    }
    
    @objc func didTapClose() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapDone() {
        // Dismiss the modal, and *after* it dismisses...
        self.dismiss(animated: true) {
            // ...run the closure, passing the text from the text view
            let enteredText = self.textView.text ?? ""
            self.onDoneButtonTapped?(enteredText)
        }
    }

}
