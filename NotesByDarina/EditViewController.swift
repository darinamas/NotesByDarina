//
//  EditViewController.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 06.06.2021.
//

import UIKit

class EditViewController: UIViewController {

    var text1 = ""
    var indexPathForEdit = 0
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = text1
        print(text1)
    }
    

    @IBAction func doneBtn(_ sender: Any) {
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storBoard.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        saveText()
        
        show(mainVC, sender: nil)
        
    }
    
    func saveText() {
        SingleTon.shared.arrayTextFromTextField[indexPathForEdit] = textField.text!
        print("Singleton array: \(SingleTon.shared.arrayTextFromTextField) ")
    }

}
