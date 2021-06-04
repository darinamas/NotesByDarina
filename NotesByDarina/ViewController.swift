//
//  ViewController.swift
//  NotesByDarina
//
//  Created by Daryna Polevyk on 04.06.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FirstTableViewCell
        
        cell.labelForCell.text = "Hello"
        
        return cell
    }
    
    @IBAction func addBtn(_ sender: Any) {
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let textViewAdd = storBoard.instantiateViewController(withIdentifier: "textViewController")
        
        show(textViewAdd, sender: nil)
    }
    

}

