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
    var textForEdit = ""
    var indexPathForEdit = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.showText(text: textForEdit)
    }
    
    @IBAction func backBtn(_ sender: Any) {
       SingleTon.shared.addNewNoteFlag == true ? saveNewText() : saveEditedText()
    }
    
    @IBAction func trashBtn(_ sender: Any) {
        if SingleTon.shared.addNewNoteFlag == true {
            showMainVC()
        } else {
            presenter.delTextFromArray(indexPath: indexPathForEdit)
            showMainVC() //otobrazajetsja VC, ubirajet tekusii
        }
    }
    
    func saveNewText() { // append new note in ST array
        SingleTon.shared.arrayWithIndexEdited.append(false)
        presenter.appendTextToArray(text: textFieldView.text!) //
        showMainVC()
    }
    func saveEditedText() {  // save edited text in the array in ST
        SingleTon.shared.arrayWithIndexEdited[indexPathForEdit] = true
        presenter.changeTextForRow(indexPath: indexPathForEdit)
        showMainVC()
        
    }
    func showMainVC(){
        navigationController?.popViewController(animated: true)
    }
    
}
