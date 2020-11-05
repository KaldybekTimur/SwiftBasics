//: Playground - noun: a place where people can play

import UIKit

// CHARACTERS
let characterA: Character = "a"

let characterDog: Character = "🐶"
print(characterDog)
let stringDog: String = "Dog"


// CONCATENTATION
var message = "Hello" + " my name is "

let name = "Matt"
message += name

let exclamationMark: Character = "!"
message += String(exclamationMark)


// INTERPOLATION
let messageInOne = "Hello my name is \(name)!"

let oneThird = 1.0 / 3.0

let oneThirdLongString = "One third is \(oneThird) as a decimal."

let oneThirdIntermediate = String(format: "%.3f", oneThird)
let oneThirdShortString = "One third is \(oneThirdIntermediate) as a decimal."


// EQUALITY
let guess = "dog"
let dogEqualsCat = guess == "cat" // false
print(dogEqualsCat)
let order = "cat" < "dog"

let stringA = "café"
let stringB = "cafe\u{0301}"

let equal = stringA == stringB

let lengthA = stringA.count
let lengthB = stringB.count

// OTHER METHODS
let string = "Swift Apprentice is a great book!"
string.uppercased()
string.lowercased()
