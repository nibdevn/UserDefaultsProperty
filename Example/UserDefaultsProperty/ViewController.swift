//
//  ViewController.swift
//  UserDefaultsProperty
//
//  Created by nibdevn@gmail.com on 10/15/2020.
//  Copyright (c) 2020 nibdevn@gmail.com. All rights reserved.
//

import UIKit
import UserDefaultsProperty

class ViewController: UIViewController {
    
    @UserDefaultsProperty(key: "Value_Int", defaultValue: 1)
    var intValue: Int
    
    @UserDefaultsProperty(key: "Value_Float", defaultValue: 2.0)
    var floatValue: Float
    
    @UserDefaultsProperty(key: "Value_Double", defaultValue: 3.0)
    var doubleValue: Double
    
    @UserDefaultsProperty(key: "Value_Bool", defaultValue: true)
    var boolValue: Bool
    
    @UserDefaultsProperty(key: "Value_String", defaultValue: "Test")
    var stringValue: String
    
    @UserDefaultsProperty(key: "Value_Date", defaultValue: Date())
    var dateValue: Date
    
    @UserDefaultsProperty(key: "Value_URL", defaultValue: URL(string: "https://github.com")!)
    var urlValue: URL
    
    @UserDefaultsProperty(key: "Value_User", defaultValue: User(age: 10, name: "James", gender: .male))
    var userValue: User
    
    @UserDefaultsProperty(key: "Value_Pet", defaultValue: [])
    var petsValue: [Pet]
    
    @UserDefaultsProperty(key: "Value_Optional_Int")
    var optionalIntValue: Int?
    
    @UserDefaultsProperty(key: "Value_Optional_Float")
    var optionalFloatValue: Float?
    
    @UserDefaultsProperty(key: "Value_Optional_Double")
    var optionalDoubleValue: Double?
    
    @UserDefaultsProperty(key: "Value_Optional_Bool")
    var optionalBoolValue: Bool?
    
    @UserDefaultsProperty(key: "Value_Optional_String")
    var optionalStringValue: String?
    
    @UserDefaultsProperty(key: "Value_Optional_Date")
    var optionalDateValue: Date?
    
    @UserDefaultsProperty(key: "Value_Optional_URL")
    var optionalUrlValue: URL?
    
    @UserDefaultsProperty(key: "Value_Optional_User", defaultValue: User(age: 10, name: "James", gender: .male))
    var optionalUserValue: User?
    
    @UserDefaultsProperty(key: "Value_Optional_Pet")
    var optionalPetsValue: [Pet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.removeAll()
        
        petsValue = [
            Pet(age: 1, type: .dog, owner: userValue),
            Pet(age: 2, type: .cat, owner: optionalUserValue!),
            Pet(age: 3, type: .rabbit, owner: userValue),
        ]
        
        optionalPetsValue = [
            Pet(age: 1, type: .dog, owner: userValue),
            Pet(age: 2, type: .cat, owner: optionalUserValue!),
            Pet(age: 3, type: .rabbit, owner: userValue),
        ]
        
        
        print("Non Optional Array before set without UserDefaultsProperty.set Method: \(petsValue[1].type.rawValue)")
        petsValue[1].type = .rabbit
        print("Non Optional Array after set without UserDefaultsProperty.set Method: \(petsValue[1].type.rawValue)")
        _petsValue.set {
            $0[1].type = .rabbit
        }
        print("Non Optional Array after set with UserDefaultsProperty.set Method: \(petsValue[1].type.rawValue)")
        
        print("Optional Array before set with UserDefaultsProperty.set Method: \(optionalPetsValue![1].type.rawValue)")
        optionalPetsValue![1].type = .rabbit
        print("Optional Array after set with UserDefaultsProperty.set Method: \(optionalPetsValue![1].type.rawValue)")
        
        if let pets1 = optionalPetsValue {
            print("Optional Binding Array: \(pets1[1].type.rawValue)")
            pets1[1].type = .rabbit
            print("Optional Binding Array: \(pets1[1].type.rawValue)")
        }
        
        if let pets2 = optionalPetsValue {
            print("Optional Binding Array: \(pets2[1].type.rawValue)")
            _optionalPetsValue.set {
                if let pets = $0 {
                    pets[1].type = .rabbit
                }
            }
            print("Optional Binding Array: \(pets2[1].type.rawValue)")
        }
        print("Optional Array after set with UserDefaultsProperty.set Method: \(optionalPetsValue![1].type.rawValue)")
    }
}
