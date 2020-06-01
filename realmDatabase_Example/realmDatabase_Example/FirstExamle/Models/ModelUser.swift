//
//  ModelUser.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import RealmSwift



@objcMembers

class ModelUser: Object {
   dynamic var name: String = String()
   dynamic var date: String = String()
   dynamic var id: Int = 0
    //отношение 1 к одному
    //var user = ModelUser()
    

}
