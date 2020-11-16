import Foundation

var name: String = "Matt Galloway"
var age: Int = 30
var occupation: String = "Software Developer & Author"

var errorCode: Int?
errorCode = 100
errorCode = nil

let ageInteger: Int? = 30
print(ageInteger)

//print(ageInteger + 1)

// IF-LET BINDING (AND FORCED UNWRAPPING)
var authorName: String? = "Matt Galloway"

var unwrappedAuthorName1 = authorName!
print("Author is \(unwrappedAuthorName1)")

//authorName = nil
//var unwrappedAuthorName2 = authorName!
//print("Author is \(unwrappedAuthorName2)")

if authorName != nil {
  var unwrappedAuthorName = authorName!
  print("Author is \(unwrappedAuthorName)")
} else {
  print("No author.")
}

if let unwrappedAuthorName = authorName {
  print("Author is \(unwrappedAuthorName)")
} else {
  print("No author.")
}

//let authorName: String? = "Matt Galloway"
let authorAge: Int? = 30

if let name: String = authorName, let age: Int = authorAge, age > 20 {
    print("The author is \(name) who is \(age) years old.")
} else {
  print("No author or no age.")
}


// NIL COALESCING
var optionalInt: Int? = 10
//optionalInt = nil
let result: Int = optionalInt ?? 0


var nname: String? = "Ray"
var aage : Int? = nil
let distance: Float = 26.7
var middleName: String? = nil


func divideIfWhole(_ value: Int, by divisor: Int) -> String?{
var answer = 0
var test = 0
    for _ in 1...value{
        if test % divisor == 0{
            answer += 1
            test -= 1
        } else{
            test -= 1
        }
    }
    if answer >= 1{
        return("Yep, it divides \(answer) times")
    }else{
        return("Not divisible :[")
    }
}

func divideIfWholeGuard(_ value: Int, by divisor: Int){
    guard let answer = divideIfWhole(value, by: divisor) else {
        print("Not divisible :[")
        return
    }
    print(answer)
}


//let test = divideIfWhole(10, by: 2)
let test2: () = divideIfWholeGuard(3, by: 2)


/*
 func divideIfWhole(_ value: Int, by divisor: Int){
 var answer = 0
 var test = 0
     for _ in 1...value{
         if test % divisor == 0{
             answer += 1
             test -= 1
         } else{
             test -= 1
         }
     }
     if answer >= 1{
         print("Yep, it divides \(answer) times")
     }else{
         print("Not divisible :[")
     }
 }
 divideIfWhole(10, by: 2)
 
 */
