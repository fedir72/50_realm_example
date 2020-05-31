//
//  DBManager.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import RealmSwift


 
protocol DBManager {
    func saveUser(user: House)
    func obtainHouses() -> [House]
    func removeObject(object: Object)
}

class DBManagerImpl: DBManager {
    //MARK: - обращение к базеданных
    fileprivate lazy var mainRealm = try! Realm(configuration: .defaultConfiguration)
    
    //MARK: - сохранение обекта в базе данных
    func saveUser(user: House) {
        
        
         try! mainRealm.write {
            mainRealm.add(user)
        }
    }
    //MARK: - удаление обьекта
    
    func removeObject(object: Object) {
        try! mainRealm.write {
            mainRealm.delete(object)
        }
    }
    
    //MARK: - извлелчение обьектов

    func obtainHouses() -> [House] {
       
        let models = mainRealm.objects(House.self)
        return  Array(models)
    }
}
