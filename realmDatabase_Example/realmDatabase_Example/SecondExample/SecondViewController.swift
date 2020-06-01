//
//  SecondViewController.swift
//  realmDatabase_Example
//
//  Created by fedir on 31.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {
    
    //MARK: - ссылка на базу данных
    let realm = try! Realm(configuration: .defaultConfiguration)
    
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
        
        //MARK: - извлечение данных из реалм в наш массив при загрузке вью
        items = Array( realm.objects(SecondModel.self))
    }
    
    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "Внимание", message: "Введите имя", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            
        }
        let action = UIAlertAction(title: "Сохранить", style: .default) { (action) in
            let text = alert.textFields?[0].text
            self.saveItem(name: text!)
        }
        let cancel = UIAlertAction(title: "Выйти", style: .destructive, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert,animated: true,completion: nil)
    }
    
    //MARK: - функция  сохранение данных в массив и в базу данных
    
    func saveItem(name: String) {
        
        let item = SecondModel()
        item.id = UUID().uuidString
        item.name = name
        items.append(item)//добавляем в массив
        
        try! realm.write {
            realm.add(item)//добавляем в базу
        }
        
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
        
        let editingRow = items[indexPath.row]//удаляемый элемент
        
        if editingStyle == .delete {
            //MARK: - удаление элеиентов из базы данных и массива
            try! self.realm.write {
                self.realm.delete(editingRow)
                items.remove(at: indexPath.row)
            }
        }
    }
    
}
