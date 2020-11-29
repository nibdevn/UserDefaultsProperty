# UserDefaultsProperty

 
![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/nibdevn/UserDefaultsProperty/blob/master/LICENSE)

## Summary
- [Requirements](#requirements)
- [Usage](#usage)
- [Installation](#installation)
- [Example](#example)

## Requirements

- Swift 5.0
- iOS 10.0+

## Usage
> Object
#### Object must be implement 'Codable' Protocol
```swift
enum  Gender: String, Codable {
    case male = "male"
    case female = "female"
}

class  User: Codable {
    var age: Int
    var name: String
    var gender: Gender
    
    init(age: Int, name: String, gender: Gender) {
        self.age = age
        self.name = name
        self.gender = gender
    }
}

enum  PetType: String, Codable {
    case dog  = "dog"
    case cat  = "cat"
    case rabbit = "rabbit"
}

class  Pet: Codable {
    var age: Int
    var type: PetType
    var owner: User

    init(age: Int, type: PetType, owner: User) {
        self.age = age
        self.type  = type
        self.owner = owner
    }
}
```
> Non Optional
```swift
@UserDefaultsProperty(key: "Value_Int", defaultValue: 1)
var  intValue: Int

@UserDefaultsProperty(key: "Value_Float", defaultValue: 2.0)
var  floatValue: Float

@UserDefaultsProperty(key: "Value_Double", defaultValue: 3.0)
var  doubleValue: Double

@UserDefaultsProperty(key: "Value_Bool", defaultValue: true)
var  boolValue: Bool

@UserDefaultsProperty(key: "Value_String", defaultValue: "Test")
var  stringValue: String

@UserDefaultsProperty(key: "Value_Date", defaultValue: Date())
var  dateValue: Date

@UserDefaultsProperty(key: "Value_URL", defaultValue: URL(string: "https://github.com")!)
var  urlValue: URL

@UserDefaultsProperty(key: "Value_User", defaultValue: User(age: 10, name: "James", gender: .male))
var  userValue: User
```
> Optional
```swift
@UserDefaultsProperty(key: "Value_Optional_Int")
var  optionalIntValue: Int?

@UserDefaultsProperty(key: "Value_Optional_Float")
var  optionalFloatValue: Float?

@UserDefaultsProperty(key: "Value_Optional_Double")
var  optionalDoubleValue: Double?

@UserDefaultsProperty(key: "Value_Optional_Bool")
var  optionalBoolValue: Bool?

@UserDefaultsProperty(key: "Value_Optional_String")
var  optionalStringValue: String?

@UserDefaultsProperty(key: "Value_Optional_Date")
var  optionalDateValue: Date?

@UserDefaultsProperty(key: "Value_Optional_URL")
var  optionalUrlValue: URL?

@UserDefaultsProperty(key: "Value_Optional_User", defaultValue: User(age: 10, name: "James", gender: .male))
var  optionalUserValue: User?
```
> Array
```swift
@UserDefaultsProperty(key: "Value_Pet", defaultValue: [])
var petValue: [Pet]

@UserDefaultsProperty(key: "Value_Optional_Pet")
var  optionalPetsValue: [Pet]?
```
## Installation

UserDefaultsProperty is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

  
```ruby

pod 'UserDefaultsProperty', :tag => '1.1.0', :git => 'https://github.com/nibdevn/UserDefaultsProperty'

```

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.
  

[license]: LICENSE
