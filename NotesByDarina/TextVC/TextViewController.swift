//
//  TextViewController.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 04.06.2021.
//
//VC for New note

import UIKit

class TextViewController: UIViewController {

   // @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldView: UITextView!
    var presenter = PresenterTextVC()
    let backImg: UIImage = UIImage(named: "backArrow")! // img for back arrow
    let backButton = UIBarButtonItem() //back button title
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        navigationItem.leftBarButtonItem?.tintColor =  UIColor(displayP3Red: 250, green: 250, blue: 250, alpha: 1)
        navigationItem.rightBarButtonItem?.tintColor = UIColor(displayP3Red: 250, green: 250, blue: 250, alpha: 1)
        navigationController?.navigationBar.backIndicatorImage = backImg //custom back button
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImg
        backButton.title = " "
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @IBAction func saveBtn(_ sender: Any) { //
        SingleTon.shared.arrayWithIndexEdited.append(false)
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storBoard.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        saveText()
    
        navigationController?.popViewController(animated: true) //show previus VC
        
    }
    
    func saveText() { // append new note in ST array
        presenter.appendTextToArray(text: textFieldView.text!) //
    }
    
}
