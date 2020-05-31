//
//  SecondModel.swift
//  realmDatabase_Example
//
//  Created by fedir on 31.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

class SecondModel {
    let name: String
    let id : String
    init(name: String) {
        self.name = name
        self.id = UUID().uuidString
    }
    
}
