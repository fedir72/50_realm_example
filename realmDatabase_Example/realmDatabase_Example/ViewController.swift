//
//  ViewController.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AddItemViewControllerDelegate {
   
    var arr = [ModelUser]() {
        didSet{
            tableview.reloadData()
        }
    }
    
    var cellId = "MyCell"

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        arr = [
            ModelUser(name: "Ivan", date: "1230303030303", id: 12),
            ModelUser(name: "Doda", date: "11111111111", id: 13),
            ModelUser(name: "gogtre", date: "00000000000", id: 14)
        ]
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }

   
    
    func AddUser(name: String,date: String,id: Int) {
        let item = ModelUser(name: name, date: date, id: id)
        arr.append(item)
    }
    
    
    @IBAction func adUserButton(_ sender: UIBarButtonItem) {
        
    }
    
   

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let itemUser = arr[indexPath.row]
        cell.setValueUser(user: itemUser)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
        }
    }
   
    
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddVC" {
            let vc = segue.destination as! AddItemViewController
            vc.delegate = self
        }
        
    }
}
