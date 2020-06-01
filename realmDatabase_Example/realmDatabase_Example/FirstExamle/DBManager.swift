//
//  DBManager.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import RealmSwift

//MARK: - класс для доступа к базеданных реалм
 
protocol DBManager {
    
    func saveUser(user: ModelUser)
    func obtainUser() -> [ModelUser]
    func removeObject(object: Object)
    func remoweAllObject()
    
}

class DBManagerImpl: DBManager {
    
    //MARK: - обращение к базеданных
    fileprivate lazy var mainRealm = try! Realm(configuration: .defaultConfiguration)
    
    //MARK: - сохранение обекта в базе данных
    func saveUser(user: ModelUser) {
        
        
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
    func remoweAllObject() {
        try! mainRealm.write {
            mainRealm.deleteAll()
        }
    }
    
    //MARK: - извлелчение обьектов

    func obtainUser() -> [ModelUser] {
       
        let models = mainRealm.objects(ModelUser.self)
        return  Array(models)
    }
    
    //MARK: - update object
    
    
}
