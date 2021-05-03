# UserDefaultsProperty


![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/nibdevn/UserDefaultsProperty/blob/master/LICENSE)

## Summary
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Example](#example)

## Requirements

- Swift 5.0
- iOS 11.0+

## Installation

#### Cocoapods

UserDefaultsProperty is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:


```ruby

pod 'UserDefaultsProperty', :tag => '2.0.0', :git => 'https://github.com/nibdevn/UserDefaultsProperty'

```

#### Swift Package Manager

You can use The Swift Package Manager to install GradientImage by adding the proper description to your Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/nibdevn/UserDefaultsProperty.git", from: "2.0.0")
    ]
)
```

Next, add GradientImage to your targets dependencies like so:

```swift
.target(
    name: "YOUR_TARGET_NAME",
    dependencies: [
        "UserDefaultsProperty",
    ]
),
```

Then run swift package update.


## Usage
> Object

#### Object must be implement 'Codable' Protocol

```swift
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

enum PetType: String, Codable {
    case dog  = "dog"
    case cat  = "cat"
    case rabbit = "rabbit"
}

class Pet: Codable {
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

@UserDefaultsProperty(key: "Value_Int")
var intValue: Int = 1

@UserDefaultsProperty(key: "Value_Float")
var floatValue: Float = 2.0

@UserDefaultsProperty(key: "Value_Double")
var doubleValue: Double = 3.0

@UserDefaultsProperty(key: "Value_Bool")
var boolValue: Bool = true

@UserDefaultsProperty(key: "Value_String")
var stringValue: String = "Test"

@UserDefaultsProperty(key: "Value_Date")
var dateValue: Date = Date()

@UserDefaultsProperty(key: "Value_URL")
var urlValue: URL = URL(string: "https://github.com")!

@UserDefaultsProperty(key: "Value_User")
var userValue: User = User(age: 10, name: "James", gender: .male)

```

> Optional

```swift
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

@UserDefaultsProperty(key: "Value_Optional_User")
var optionalUserValue: User? = User(age: 10, name: "James", gender: .male)

```

> Array

```swift
@UserDefaultsProperty(key: "Value_Pet")
var petsValue: [Pet] = []

@UserDefaultsProperty(key: "Value_Optional_Pet")
var optionalPetsValue: [Pet]?
```

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.


[license]: LICENSE
