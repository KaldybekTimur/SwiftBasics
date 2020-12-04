import UIKit
import Foundation

class Cat{
    var name: String
    init(name : String) {
        self.name = name
    }
}

class Dog {
  var name: String
  init(name: String) {
        self.name = name
    }
}
// MARK: - Anatomy of generic types
///Generics provide a mechanism for using one set of types to define a new set of types.🤔

/*
 class Keeper<Animal>{}
 var aCatKeepeer = Keeper<Cat>()
 var aKeeper = Keeper() // compile-time error!
*/

///That Animal in angle brackets is the type parameter that specifies the type for the kind of animal you’re keeping.
///In one stroke, the generic type Keeper<Animal> defines a family of new types

// MARK: - Using type parameters

class Keeper<Animal> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal
    
init(name: String, morningCare: Animal, afternoonCare: Animal){
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}

let jason = Keeper(name: "Jason", morningCare: Cat(name: "Whiskers"), afternoonCare: Cat(name: "Bobby"))
let don = Keeper(name: "Donn", morningCare: Dog(name: "Rax"), afternoonCare: Dog(name: "Boy"))


// MARK: - Define Array
let animalAges: [Int] = [2,5,7,9]
/// The same as
let animaAgs: Array<Int> = [2,5,7,9]


// MARK: - Generic function parameters

func swapped<L, R>(_ x: L, _ y: R) -> (R, L) {
    (y, x)
}
swapped(33, "Jay")
