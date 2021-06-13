//
//  EditViewController.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 06.06.2021.
//

import UIKit

class EditViewController: UIViewController {
    
    var presenter = PresenterEditVC ()

    var text1 = ""
    var indexPathForEdit = 0
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        
        presenter.showText(text: text1) // show text in text field
     
    }
    

    @IBAction func doneBtn(_ sender: Any) {
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storBoard.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        saveText()
        
        navigationController?.popViewController(animated: true) //otobrazajetsja VC
        SingleTon.shared.arrayWithIndexEdited[indexPathForEdit] = true
    print("Nas array \(SingleTon.shared.arrayWithIndexEdited)")
    }
    
    
    func saveText() {  // save edited text in the array in ST
  
        presenter.changeTextForRow(indexPath: indexPathForEdit)
   
    }

    @IBAction func deleteText(_ sender: Any) {
        print("Index from controller:  \(indexPathForEdit)")
        
        presenter.delTextFromArray(indexPath: indexPathForEdit)
        print(SingleTon.shared.arrayTextFromTextField)
        print(SingleTon.shared.arrayWithIndexEdited)
        navigationController?.popViewController(animated: true) //otobrazajetsja VC, ubirajet tekusii
    }
}
