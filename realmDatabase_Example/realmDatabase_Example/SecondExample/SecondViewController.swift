//
//  SecondViewController.swift
//  realmDatabase_Example
//
//  Created by fedir on 31.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var items = [SecondModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource =  self
        tableView.register(UINib(nibName: "SecondCell", bundle: nil), forCellReuseIdentifier: "SecondCell")
    }
    
    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "Внимание", message: "Введите имя", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            
        }
        let action = UIAlertAction(title: "Сохранить", style: .default) { (action) in
            let text = alert.textFields?[0].text
            let item = SecondModel(name: text!)
            self.items.append(item)
        }
        let cancel = UIAlertAction(title: "Выйти", style: .destructive, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert,animated: true,completion: nil)
    }
    
    
    func saveItem(name: String) {
        let item = SecondModel(name: name)
        items.append(item)
    }
    

}

extension SecondViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondCell
        cell.setupCell(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
        }
    }
    
}
