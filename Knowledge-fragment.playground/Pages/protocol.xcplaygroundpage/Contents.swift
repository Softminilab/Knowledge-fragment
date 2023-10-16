//: [Previous](@previous)

import Foundation

protocol Shape {
  var name: String { get set }
  var color: String { get }
}

struct Circle: Shape {
  var name: String
  let color: String = "Red" // Only reader
}

//func hh() {
//    var c = Circle(name: "Circle")
//    print(c.name) // "Circle"
//    c.name = "C" // 可以设置name
//
//    print(c.color) // "Red"
//    c.color = "Blue" // Error,只读属性
//
//}

let ary1 = ["a"]
let ary2 = ["a"]
print((ary1 == ary2) ? "相等" : "不等")

enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(starts: Int)
}

var levels = [
    SkillLevel.beginner,
    SkillLevel.intermediate,
    SkillLevel.expert(starts: 3),
    SkillLevel.expert(starts: 5)
]

func adjust() {
    for level in levels.sorted() {
        print("\(level)")
    }
}

adjust()

protocol SomeClassOnlyProtocol: AnyObject {
    var someValue: Int { get }
}

struct SomeStruct: SomeClassOnlyProtocol {
    
}

class SomeClass: SomeClassOnlyProtocol {
    var someValue: Int = 0
}

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

print(equalNumbers.allEqual())
// Prints "true"
print(differentNumbers.allEqual())
// Prints "false"
