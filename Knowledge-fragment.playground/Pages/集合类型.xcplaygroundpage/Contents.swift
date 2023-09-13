//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let shoppingList = ["Milk", "Eggs", "Water", "Mango juice"]

for (index, value) in shoppingList.enumerated() {
    print("index: \(index), value: \(value)")
}

//let temperatureIncelsius = 100
//let weatherAdvice = if temperatureIncelsius > 100 {
//    "boiling"
//} else {
//    "It's good"
//}
//
//print(weatherAdvice)

print("-------------------")

var score = 5

if score < 10 {
    defer {
        print(score)
    }
    
    defer {
        print("This score is:")
    }
    
    score += 5
}


