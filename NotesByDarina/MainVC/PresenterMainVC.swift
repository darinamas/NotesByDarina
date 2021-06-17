//
//  PresenterMainVC.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 10.06.2021.
//

import Foundation

class PresenterMainVC {
    
    var view: ViewController?
    
    func updateFilterSwitch() {
        if SingleTon.shared.isFilterBtnOn == true {
            SingleTon.shared.isFilterBtnOn = false
            print(false)
        } else {
            SingleTon.shared.isFilterBtnOn = true
            print(true)
        }
    }


}
