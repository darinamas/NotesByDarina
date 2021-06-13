//
//  TextViewController.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 04.06.2021.
//
//VC for New note

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var presenter = PresenterTextVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        
    }
    
    @IBAction func saveBtn(_ sender: Any) { //
        SingleTon.shared.arrayWithIndexEdited.append(false)
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storBoard.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        saveText()
    
        navigationController?.popViewController(animated: true) //show previus VC
        
    }
    
    func saveText() { // append new note in ST array
     //   view!.textField.text!
        presenter.appendTextToArray(text: textField.text!) //
    }
    
}
