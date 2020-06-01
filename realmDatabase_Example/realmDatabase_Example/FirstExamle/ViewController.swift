//
//  ViewController.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
//import RealmSwift

class ViewController: UIViewController,AddItemViewControllerDelegate {
    
    //MARK: -  экзэмпляр класса сохранения данных DBManager
    let dbManager: DBManager = DBManagerImpl()
   
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
        
         
        self.arr = self.dbManager.obtainUser()
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
       
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    //MARK: - обнуление всей базы данных
     
    @IBAction func deleteAllBarButtonItem(_ sender: Any) {
        self.dbManager.remoweAllObject()// обнуление базы полностью
        arr = [] //обнуление текущего массива в таблице
    }
    
   
    
    func AddUser(name: String,date: String,id: Int) {
        let item = ModelUser()
        item.date = date
        item.id = id
        item.name = name
        arr.append(item)
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
            
             //удаление из базы данных
            let obj = arr[indexPath.row]
            self.dbManager.removeObject(object: obj)
            //удаление из массива
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
