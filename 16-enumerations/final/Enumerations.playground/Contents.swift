import UIKit

// List out all the months in a year
enum Month: Int {
  case January = 1, February, March, April, May, June, July,
  August, September, October, November, December
}

// Figure out which semester the month belongs
func schoolSemester(_ month: Month) -> String {
  switch month {
  case .August, .September, .October, .November, .December:
    return "Autumn"
  case .January, .February, .March, .April, .May:
    return "Spring"
  default:
    return "Not in the school year"
  }
}

// Print out the result in the playground sidebar
var month = Month.April
month = .September
schoolSemester(month) // "Autumn"


func monthsUntilWinterBreak(_ month: Month) -> Int {
  return Month.December.rawValue - month.rawValue
}
monthsUntilWinterBreak(.April) // 8

if let fifthMonth = Month(rawValue: 5) {
  monthsUntilWinterBreak(fifthMonth)  // 7
}




enum Coin: Int {
  case Penny = 1
  case Nickel = 5
  case Dime = 10
  case Quarter = 25
}

let coin = Coin.Quarter
coin.rawValue // 25





enum WithdrawalResult {
  case Success(Int)
  case Error(String)
}

var balance = 100

func withdraw(amount: Int) -> WithdrawalResult {
  if amount <= balance {
    balance -= amount
    return .Success(balance)
  } else {
    return .Error("Not enough money!")
  }
}

let result = withdraw(amount: 99)

switch result {
case let .Success(newBalance):
  print("Your new balance is: \(newBalance)")
case let .Error(message):
  print(message)
}

enum HTTPMethod {
  case GET
  case POST(String)
}

enum TrafficLight {
  case Red, Yellow, Green
}
let trafficLight = TrafficLight.Red




var age: Int?
age = 17
age = nil

let email: Optional<String> = .none
let website: Optional<String> = .some("raywenderlich.com")

switch website {
case .none:
  print("No value")
case let .some(value):
  print("Got a value! \(value)")
}

let optionalNil: Optional<Int> = .none

optionalNil == nil    // true
optionalNil == .none  // true



enum Icon: String{
    case music
    case sport
    case weather
    
    var filename: String {
        "\(rawValue).png"
    }
}

let icon = Icon.weather
icon.filename


enum Pet: CaseIterable{
    case cat, dog, bird, turtle, fish, hamster
}
for pet in Pet.allCases{
    print(pet)
}


/*
 • An enumeration - это список взаимоисключающих случаев, определяющих общий тип.
 • Enumerations обеспечивают безопасную для типов альтернативу старомодным целочисленным значениям.
 • Вы можете использовать enumerations для обработки ответов, хранения состояния и инкапсуляции значений.
 • CaseIterable позволяет выполнять перечисление в цикле с использованием allCases.
 • Uninhabited enumerations могут использоваться как пространства имен и предотвращать создание экземпляров.
 */

