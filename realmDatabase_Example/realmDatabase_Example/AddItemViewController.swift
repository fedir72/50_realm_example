//
//  AddItemViewController.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit


protocol AddItemViewControllerDelegate {
    func AddUser(name: String,date: String,id: Int)
}
class AddItemViewController: UIViewController {
    
    var delegate: AddItemViewControllerDelegate?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var idCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addUserButton(_ sender: UIButton) {
        if nameTextField.text!.count > 0,dateTextField.text!.count > 0, idCodeTextField.text!.count > 0 {
        let name = nameTextField.text
        let date = dateTextField.text
        let id = Int(idCodeTextField.text!)
        
        self.delegate?.AddUser(name: name!, date: date!, id: id!)
            navigationController?.popViewController(animated: true)
        }else{
            let alert = UIAlertController(title: "Atension", message: "Plea enter all data", preferredStyle: .actionSheet)
            let buton = UIAlertAction(title: "Продолжить", style: .destructive, handler: nil)
            alert.addAction(buton)
            present(alert,animated: true,completion: nil)
        }
    }

   

}