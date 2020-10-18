//
//  Pet.swift
//  UserDefaultsProperty_Example
//
//  Created by MacBook-Na on 2020/10/15.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

enum PetType: String, Codable {
    case dog    = "dog"
    case cat    = "cat"
    case rabbit = "rabbit"
}

class Pet: Codable {
    
    var age: Int
    var type: PetType
    var owner: User
    
    init(age: Int, type: PetType, owner: User) {
        self.age   = age
        self.type  = type
        self.owner = owner
    }
}
