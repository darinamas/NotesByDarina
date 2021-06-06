//
//  TextViewController.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 04.06.2021.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
  //  var text1 = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storBoard.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        saveText()
        show(mainVC, sender: nil)
        
    }
    
    func saveText() {
        SingleTon.shared.arrayTextFromTextField.append("\(textField.text!)")
        print("Singleton array: \(SingleTon.shared.arrayTextFromTextField) ")
    }
    
}
