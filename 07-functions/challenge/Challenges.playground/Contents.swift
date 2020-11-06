import Foundation

// Challenge A
func isNumberDivisible(number: Int, by byNumber: Int) -> Bool {
  return number % byNumber == 0
}

func isPrime(number: Int) -> Bool {
  if number < 0 {
    return false
  }

  if number <= 3 {
    return true
  }

  let root = Int(sqrt(Double(number)))
  for i in 2...root {
    if isNumberDivisible(number: number, by: i) {
      return false
    }
  }
  return true
}
isPrime(number: 6)
isPrime(number: 13)
isPrime(number: 8893)


// Challenge B
func fibonacci(number: Int) -> Int {
  if number <= 0 {
    return 0
  }

  if number == 1 || number == 2 {
    return 1
  }

  return fibonacci(number: number - 1) + fibonacci(number: number - 2)
}




fibonacci(number: 1)
fibonacci(number: 2)
fibonacci(number: 3)
fibonacci(number: 4)
fibonacci(number: 5)
fibonacci(number: 10)
