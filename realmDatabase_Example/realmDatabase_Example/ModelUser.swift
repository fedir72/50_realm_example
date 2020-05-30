//
//  ModelUser.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

class ModelUser {
    var name: String
    var date: String
    var id: Int
    init(name: String,date: String,id: Int) {
        self.id = id
        self.date = date
        self.name = name
    }
}
