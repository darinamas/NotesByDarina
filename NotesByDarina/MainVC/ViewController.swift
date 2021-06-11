//
//  ViewController.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 04.06.2021.
//
//Main VC

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    var presenter = PresenterMainVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter.view = self
    }
    
    override func viewWillAppear(_ animated: Bool) { //we make reload befor VC appear
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingleTon.shared.arrayTextFromTextField.count //return number of array elements in ST
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FirstTableViewCell
        
        cell.labelForCell.text = SingleTon.shared.arrayTextFromTextField[indexPath.row]
 
        return cell
    }
    
    @IBAction func tapAddBtn(_ sender: Any) {  // when we tap on the + TextVC appear
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let textFieldVC = storBoard.instantiateViewController(withIdentifier: "textViewController") as! TextViewController
        presenter.changeColor()
        show(textFieldVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {  // when we tap on the Row will appear EditVC
        
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let editFieldVC = storBoard.instantiateViewController(withIdentifier: "EditVC") as! EditViewController
       
        editFieldVC.text1 = SingleTon.shared.arrayTextFromTextField[indexPath.row]
        editFieldVC.indexPathForEdit = indexPath.row
        
        show(editFieldVC, sender: nil)
    }
  
}

