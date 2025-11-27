//
//  ReadingTableViewController.swift
//  Stuttering App
//
//  Created by sdc - user on 27/11/25.
//

import UIKit

class ReadingTableViewController: UITableViewController {

    private var textForDetailView: String = ""
    private var titleForDetailView: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellTitle = presetTitles[indexPath.row]
        // First 9 cells (Preset Content)
        if indexPath.row < 9 {
            let cellTitle = presetTitles[indexPath.row]
            self.textForDetailView = presetContent[indexPath.row]
            presentModal(withTitle: cellTitle)
            
        // 10th cell (Custom Content)
        } else if indexPath.row == 9 {
            presentTextInputModal()
        }
        
    }
    
    func presentModal(withTitle title: String) {
            guard let modalNav = storyboard?.instantiateViewController(withIdentifier: "ModalNavigationController") as? UINavigationController,
                  let modalVC = modalNav.topViewController as? ModalViewController else {
                return
            }
            
            modalVC.modalTitle = title
            
            modalVC.onDoneButtonTapped = { [weak self] in
                self?.showDetailScreen()
            }
            
            if let sheet = modalNav.sheetPresentationController {
                let customDetent = UISheetPresentationController.Detent.custom { context in
                    return 200 // custom height
                }
                sheet.detents = [customDetent]
                sheet.prefersGrabberVisible = false
            }
            
            // *** REMOVE THIS LINE to allow tapping outside to dismiss ***
            // modalNav.isModalInPresentation = true
            
            self.present(modalNav, animated: true, completion: nil)
        }
    
   func presentTextInputModal() {
        guard let modalNav = storyboard?.instantiateViewController(withIdentifier: "TextInputNavigationController") as? UINavigationController,
              let textInputVC = modalNav.topViewController as? TextInputViewController else {
            return
        }

        if let sheet = modalNav.sheetPresentationController {
            let customDetent = UISheetPresentationController.Detent.custom { context in
                return 500 // Your custom height
            }
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = false
        }

        textInputVC.onDoneButtonTapped = { [weak self] (enteredText) in
            self?.textForDetailView = enteredText
            self?.showDetailScreen()
        }

        self.present(modalNav, animated: true, completion: nil)
    }
    

    func showDetailScreen() {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController else {
            return
        }
        
        // Pass the text
        detailVC.textToDisplay = self.textForDetailView
        detailVC.titleToDisplay = self.titleForDetailView
        
        
        // --- *** UPDATED PRESENTATION LOGIC *** ---
        
        // 1. Wrap the DetailVC in its own Navigation Controller
        //    This is required to show the top bar with the close button
        let detailNav = UINavigationController(rootViewController: detailVC)
        
        // 2. Set the presentation style to full screen
        detailNav.modalPresentationStyle = .fullScreen
        
        // 3. Present it modally
        self.present(detailNav, animated: true, completion: nil)
    }

}
