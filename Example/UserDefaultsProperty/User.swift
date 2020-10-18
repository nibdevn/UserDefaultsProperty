//
//  User.swift
//  UserDefaultsProperty
//
//  Created by nibdevn@gmail.com on 10/15/2020.
//  Copyright (c) 2020 nibdevn@gmail.com. All rights reserved.
//

import Foundation

enum Gender: String, Codable {
    case male = "male"
    case female = "female"
}

class User: Codable {
    var age: Int
    var name: String
    var gender: Gender
    
    init(age: Int, name: String, gender: Gender) {
        self.age = age
        self.name = name
        self.gender = gender
    }
}
