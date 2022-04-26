import UIKit
/**
 Retain Cycle
 */

// value type e.g
struct CarValueType {
    var brand: String
}

// inititailize car1 with Car Struct
//var car1 = CarValueType(brand: "Mercedes")

// assign car1 to car2
//var car2 = car1

//change the value of car1
//car1.brand = "Audi"

//print(car1.brand)
//print(car2.brand)


// Rerence type e.g

class CarRefrenceType {
    var brand: String
    
    init(brand: String){
        self.brand = brand
    }
}

//var car1 = CarRefrenceType(brand: "Mercedes")
//
//var car2 = car1
//
//car1.brand = "Audi"
//print(car1.brand)
//print(car2.brand)


class MyNewCar {
    let brand: String
    init(brand: String) {
        self.brand = brand
        print("\(brand) is being initialized")
    }
    
    deinit {
        print("\(brand) is being deinitialized")
    }
}

//var porsche: MyNewCar?
//var mercedes: MyNewCar?
//var ford: MyNewCar?
//
//porsche = MyNewCar(brand: "Porsche")
//mercedes = porsche
//ford = porsche
//
//porsche = nil
//mercedes = nil
//ford = nil

//class Apartment {
//    let number: Int
//    weak var tenant: Person? // when strongly refrenced it keeps counting everytime the tenant is equalt to bob and retains the reference but when weak it won't count it evey time tenant is assign to bob.
//
//    init(nummber: Int) {
//        self.number = nummber
//    }
//}


//var bob: Person? = Person(name: "Bob")
//var jon: Person? = Person(name: "Jon")
//let apt = Apartment(nummber: 123)
//apt.tenant = bob
//print("\(apt.tenant?.name ?? "No tenant") lives in apartmetn # \(apt.number)")
//
//bob = nil

/**
 MARK:- Person class with retain cycle
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


