import UIKit
/**
 MARK:- Retain Cycle
 */
class Car {
    var brand: String
    weak var driver: Person?
    
    init(brand: String) {
        self.brand = brand
    }
    
    deinit {
        print("Car object is being deallocated.")
    }
}

class Person {
    var name: String
    var car: Car?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) Object is being deallocated.")
    }
}


var mercedes: Car? = Car(brand: "mercedes")
var john: Person? = Person(name: "John")

mercedes?.driver = john
john?.car = mercedes
john = nil
mercedes = nil


