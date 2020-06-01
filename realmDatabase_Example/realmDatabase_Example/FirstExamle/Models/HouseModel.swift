//
//  HouseModel.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import RealmSwift
//модель дома для примера отношений один ко многим

@objcMembers
class House: Object {
    //list внутренний  контейнер у реалм для отображения связей 
    var users = List<ModelUser>()
}
