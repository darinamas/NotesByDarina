//
//  SingleTon.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 04.06.2021.
//

import Foundation

class SingleTon {
   static var shared = SingleTon()
   
    var arrayTextFromTextField = ["Hello", "Bye", "CC"]
    //var isCellEdit = false
    var arrayWithIndexEdited: [Bool] = [false, false, false]
    
    private init() {
    }
}

struct Note {
    var text: String
    var date: Date?
}
