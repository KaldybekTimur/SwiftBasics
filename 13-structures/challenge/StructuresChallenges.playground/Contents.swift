import Foundation

//:
//: ## Challenge A: Clothing your structs
//:
//: Create a T-shirt struct that has size, color and material options. Provide methods to calculate the cost of a shirt based on its attributes.

let Small = "Small"
let Medium = "Medium"
let Large = "Large"
let XLarge = "XLarge"

let Cotton = "Cotton"
let Polyester = "Polyester"
let Wool = "Wool"

struct TShirt {
  let size: String
  let color: String
  let material: String
    
    // Note: Using a Float is good for demonstrations, but you should not use Floats or
    // Doubles for currency!
    //
    // Read http://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency
    
    func cost() -> Double{
        let basePrice = 10.0
        
        let sizeMultiplier: Double
        switch size{
        case Small, Medium:
          sizeMultiplier = 1.0
        case Large, XLarge:
          sizeMultiplier = 1.1
        default:
          // Special order!
          sizeMultiplier = 1.2
        }
        let materialMultipler: Double
        switch material{
        case Cotton:
          materialMultipler = 1.0
        case Polyester:
          materialMultipler = 1.1
        case Polyester:
          materialMultipler = 1.5
        default:
          // Special order!
          materialMultipler = 2.0
        }
        
        return basePrice * sizeMultiplier * materialMultipler
    }
}

print(TShirt(size: "Large", color: "Black", material: "Polyester").cost())
print(TShirt(size: Medium, color: "Green", material: Cotton).cost())
print(TShirt(size: XLarge, color: "Gray", material: Wool).cost())



//:
//: ## Challenge B: Battling ships
//:
//: Write the engine for a Battleship-like game. If you aren't familiar with Battleship, see here: http://abt.cm/1YBeWms
//:
//: • Use an (x, y) coordinate system for your locations.
//:
//: • Make a struct for each ship. Record an origin, direction and length.
//:
//: • Each ship should be able to report if a “shot” has resulted in a “hit” or is off by 1.


struct Coordinate {
  let x: Int
  let y: Int
}

struct Ship {
  let origin: Coordinate
  let direction: String
  let length: Int

  func isHit(coordinate: Coordinate) -> Bool {
    if direction == "Right" {
      return origin.y == coordinate.y &&
        coordinate.x >= origin.x &&
        coordinate.x - origin.x < length
    } else {
      return origin.x == coordinate.x &&
        coordinate.y >= origin.y &&
        coordinate.y - origin.y < length
    }
  }
}

struct Board {

  var ships: [Ship] = []

  func fire(location: Coordinate) -> Bool {
    for ship in ships {
      if ship.isHit(coordinate: location) {
        print("Hit!")
        return true
      }
    }

    return false
  }
}

let patrolBoat = Ship(origin: Coordinate(x: 2, y: 2), direction: "Right", length: 2)
let battleship = Ship(origin: Coordinate(x: 5, y: 3), direction: "Down", length: 4)
let submarine = Ship(origin: Coordinate(x: 0, y: 0), direction: "Down", length: 3)

var board = Board()
board.ships.append(contentsOf: [patrolBoat, battleship, submarine])

// patrolBoat
board.fire(location: Coordinate(x: 2, y: 2))

// miss
board.fire(location: Coordinate(x: 2, y: 3))

// end of battleship
board.fire(location: Coordinate(x: 5, y: 6))

// miss (just past the end of battleship)
board.fire(location: Coordinate(x: 5, y: 7))


// MARK: - Turning a function into a method


var months = ["January", "February", "March",
             "April", "May", "June",
             "July", "August", "September",
             "October", "November", "December"]

struct SimpleDate1{
    var month: String
//    var calculate : Int{
//        get{
//            let result = months.firstIndex(of: "December")! - months.firstIndex(of: month)!
//            return Int(result)
//        }
    
    func monthsUntilWinterBreak(from date: SimpleDate1) -> Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
}
let date = SimpleDate1(month: "March")
date.monthsUntilWinterBreak(from: date)


// MARK: - Initializers in structures

 ///Инициализаторы обеспечивают установку всех свойств до того, как экземпляр будет готов к использованию:

struct SimpleDate2 {
    var month: String
    var day: Int
    
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }

    
    
func monthsUntilWinterBreak() -> Int { months.firstIndex(of: "December")! -
months.firstIndex(of: month)!
    }
}

let valentinesDay = SimpleDate2(month: "February", day: 14)
valentinesDay.month // February
valentinesDay.day // 14


// MARK: - Default values and initializers

 struct SimpleDate {
//1
    var month = "January"
    var day = 1
//2
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
}
 

let newYear = SimpleDate()
newYear.day
newYear.month

let octoberFirst = SimpleDate(month: "October")
octoberFirst.month // October
octoberFirst.day // 1

let januaryTwentySecond = SimpleDate(day: 22)
januaryTwentySecond.month // January
januaryTwentySecond.day // 22


/// Ключевое слово mutating отмечает метод, изменяющий значение структуры. Поскольку структура является типом значения, система копирует ее каждый раз, когда она передается в приложение. Если метод изменяет значение одного из свойств, то исходный и скопированный экземпляры больше не будут эквивалентны.
