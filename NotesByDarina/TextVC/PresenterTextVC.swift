//
//  PresenterTextVC.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 10.06.2021.
//

import Foundation

class PresenterTextVC {
    var view: TextViewController?
    
    
    func appendTextToArray () { // append text to array in ST
        SingleTon.shared.arrayTextFromTextField.append("\(view!.textField.text!)")
        print("Singleton array: \(SingleTon.shared.arrayTextFromTextField) ")
    }
}
