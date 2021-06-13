//
//  PresenterEditVC.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 10.06.2021.
//

import Foundation

class PresenterEditVC {
    
    var view: EditViewController?
    
    func showText(text: String) { //shows text to edit in the text field
        
        view!.textField.textColor = .magenta
        view!.textField.text = text
    }
    
    func changeTextForRow (indexPath: Int) {  // changed text in element array in ST
        SingleTon.shared.arrayTextFromTextField[indexPath] = view!.textField.text!
        print("Singleton array: \(SingleTon.shared.arrayTextFromTextField) ")
    }
    
    func delTextFromArray(indexPath: Int) {
        print(indexPath)
        
        SingleTon.shared.arrayWithIndexEdited.remove(at: indexPath)
       SingleTon.shared.arrayTextFromTextField.remove(at: indexPath)
        
    }
}
