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
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 107/255, blue: 92/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 250, green: 250, blue: 250, alpha: 1)] //Title

        navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 250, green: 250, blue: 250, alpha: 1) //Buttons
       
        //MARK: custom table view
        tableView.separatorStyle = .none
  
    }
    
    override func viewWillAppear(_ animated: Bool) { //we make reload befor VC appear
        tableView.reloadData()
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingleTon.shared.arrayTextFromTextField.count //return number of array elements in ST
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FirstTableViewCell //pereispolzujutsya yacejki
        
        if SingleTon.shared.arrayWithIndexEdited[indexPath.row] == true  {
            cell.viewForCell.backgroundColor = UIColor(red: 254/255, green: 255/255, blue: 212/255, alpha: 1)  //background: rgba(254, 255, 212, 1);

        } else {
            cell.viewForCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)  //background: rgba(255, 255, 255, 1);

        }
// Cell customise
        
        cell.viewForCell.layer.borderColor = UIColor.black.cgColor
        cell.viewForCell.layer.cornerRadius = 15
        cell.viewForCell.clipsToBounds = true
        cell.viewForCell.layer.shadowColor = UIColor.black.cgColor
        cell.viewForCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.labelForCell.text = SingleTon.shared.arrayTextFromTextField[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.viewForCell.layer.shadowRadius = 2.0
        cell.viewForCell.layer.shadowOpacity = 0.5
        cell.viewForCell.layer.masksToBounds = false
     
        return cell
    }


    
    @IBAction func sortBtn(_ sender: Any) {
    }
    
    
    @IBAction func tapAddBtn(_ sender: Any) {  // when we tap on the + TextVC appear
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let textFieldVC = storBoard.instantiateViewController(withIdentifier: "textViewController") as! TextViewController
        
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

