//: Playground - noun: a place where people can play

// CLOSURES
var multiplyClosure: (Int, Int) -> Int

multiplyClosure = { (a: Int, b: Int) -> Int in
  return a * b
}
multiplyClosure(4, 2)

multiplyClosure = { (a: Int, b: Int) -> Int in
  a * b
}
multiplyClosure(4, 2)

multiplyClosure = { (a: Int, b: Int) in
  a * b
}
multiplyClosure(4, 2)

multiplyClosure = { (a, b) in
  a * b
}
multiplyClosure(4, 2)

multiplyClosure = { $0 * $1 }
multiplyClosure(4, 2)


func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
  let result = operation(a, b)
  print(result)
  return result
}

let addClosure = { (a: Int, b: Int) in
  a + b
}
operateOnNumbers(4, 2, operation: addClosure)

func addFunction(a: Int, b: Int) -> Int {
  return a + b
}
operateOnNumbers(4, 2, operation: addFunction)

operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
  return a + b
})

operateOnNumbers(4, 2, operation: {
  $0 + $1
})

operateOnNumbers(4, 2) {
  $0 + $1
}

let voidClosure: () -> Void = {
  print("Swift Apprentice is awesome!")
}
voidClosure()

var counter = 0
let incrementCounter = {
  counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
counter

func countingClosure() -> (() -> Int) {
  var counter = 0
  let incrementCounter: () -> Int = {
    counter += 1
    return counter
  }
  return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

counter1() // 0
counter2() // 0
counter1() // 1
counter1() // 2
counter2() // 1




func repeatTask(times: Int, task: () -> Void){
    for _ in 1...times{
       task()
    }
}
repeatTask(times: 10) {
    print("Hello")
}



func mathSum(times: Int, operation: (Int) -> Int) -> Int{
    for _ in 1...times{
    return operation(times)
    }
    return operation(times)
}

// Iterating over collections with closures

var prices = [1.5, 10, 4.99, 2.30, 8.19]
let largePrices = prices.filter {
$0 > 5
}
let largePrize = prices.first{
    $0 > 5
}
print(largePrize ?? 0)

let userInput = ["0", "11", "haha", "42"]

let numbers1 = userInput.map {
Int($0)
}
print(numbers1)

let numbers2 = userInput.compactMap {
Int($0)
}
print(numbers2)



