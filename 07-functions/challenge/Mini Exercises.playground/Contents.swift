import Foundation

// Functions
func printFullName(_ firstName: String, lastName: String) {
  print(firstName + " " + lastName)
}
printFullName("Matt", lastName: "Galloway")

func printFullName(_ firstName: String, _ lastName: String) {
  print(firstName + " " + lastName)
}
printFullName("Matt", "Galloway")

func calculateFullName(_ firstName: String, _ lastName: String) -> String {
  return firstName + " " + lastName
}
let fullName = calculateFullName("Matt", "Galloway")

func calculateFullName2(_ firstName: String, _ lastName: String) -> (String, Int) {
  let fullName = firstName + " " + lastName
  return (fullName, fullName.count)
}
let fullNameLength = calculateFullName2("Matt", "Galloway").1
