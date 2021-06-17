//
//  PresenterTextVC.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 10.06.2021.
//

import Foundation

class PresenterTextVC {
    var view: TextViewController?
    
    func appendTextToArray (text: String) { // append text to array in ST
        SingleTon.shared.arrayTextFromTextField.append(text)
    }
    
    func showText(text: String) { //shows text to edit in the text field
        view!.textFieldView.text = text
    }
    
    func changeTextForRow (indexPath: Int) {  // changed text in element array in ST
        SingleTon.shared.arrayTextFromTextField[indexPath] = view!.textFieldView.text!
    }
    
    func delTextFromArray(indexPath: Int) {
        SingleTon.shared.arrayWithIndexEdited.remove(at: indexPath)
        SingleTon.shared.arrayTextFromTextField.remove(at: indexPath)
        
    }
//    func filterArray(){
//        for i in 0..<SingleTon.shared.arrayWithIndexEdited.count {
//            if SingleTon.shared.arrayWithIndexEdited[i] == true {
//                SingleTon.shared.filteredArray?.append(SingleTon.shared.arrayTextFromTextField[i])
//            }
//        }
//    }
    
}
