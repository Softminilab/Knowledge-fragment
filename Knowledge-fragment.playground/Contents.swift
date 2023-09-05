import UIKit
import Foundation

enum Months {
    case January
    case Other(String)
    case `default`
}

let month: Months = .default

switch month {
case .January:
    print("Current is Juanary")
case .Other(let x):
    print("Current is \(x)")
case .default:
    print("Default")
}

// # 一个函数可以返回另一个函数作为其值
func makePlusNumber() -> ((Int) -> (Int)) {
    
    // method 1
    func abc(a: Int) -> Int {
        return a + 1
    }
    
    return abc
    
    //     method 2
    //    return { a in
    //        a + 1
    //    }
}

let abc = makePlusNumber()
let result = abc(1)
print(result)

// # 一个函数可以将另一个函数作为其参数之一。
func isExist(list: [Int], condition: (Int) -> Bool) -> Bool {
    for i in list {
        if condition(i) {
            return true
        }
    }
    return false
}

func condition(a: Int) -> Bool {
    return a > 8
}

isExist(
    list: [1,20],
    condition: condition
)

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very Simple class."
    
    func adjust() {
        simpleDescription += " already adjusted."
    }
}

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A Simple struct."
    
    mutating func adjust() {
        simpleDescription += "New (adjusted)."
    }
}

var a = SimpleClass()
a.adjust()
a.simpleDescription

var b = SimpleStruct()
b.simpleDescription
b.adjust()
b.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
var seven = 7
seven.simpleDescription
seven.adjust()

extension Double: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42.76
    }
}

var absoluteValue = 7.06
absoluteValue.simpleDescription
absoluteValue.adjust()

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3, 4], rhs: [5])

func anyCommonElementsInArray<T: Sequence, U: Sequence>(_ lhs: T, rhs: U) -> [T.Element]
where T.Element: Equatable, T.Element == U.Element {
    
    var result: [T.Element] = []
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                result.append(lhsItem)
            }
        }
    }
    return result
}
let commonResult = anyCommonElementsInArray([1, 2, 3, 4, 5], rhs: [5])

print(type(of: commonResult))

func anyElementEqual<T: Equatable>(_ lhs: T, rsh: T) -> Bool {
    return lhs == rsh
}

anyElementEqual("22", rsh: "19")

