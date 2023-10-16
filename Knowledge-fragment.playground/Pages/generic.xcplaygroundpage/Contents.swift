//: [Previous](@previous)

import Foundation

func swapTwoString(a: inout String, b: inout String) {
    let temp = a
    a = b
    b = a
}

var a = "1", b = "2"
swapTwoString(a: &a, b: &b)
print("\(a) : \(b)")

func swapTwoValues<T>(a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = a
}

var c = 1, d = 2
swapTwoValues(a: &c, b: &d)
print("c:\(c), d:\(d)")


struct Stack<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

print(stack.pop())

print(stack)

var dic = Dictionary<String, Bool>()
dic["a"] = true
dic["b"] = true
print(dic)

//func findIndex<T>(of valueToFind: T, in array: [T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if valueToFind == value {
//            return index
//        }
//    }
//    
//    return nil
//}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if valueToFind == value {
            return index
        }
    }
    
    return nil
}

if let index = findIndex(of: 2, in: [1,2,3,4,455,6]) {
    print(index)
}


protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    subscript(i: Int) -> Int {
        items[i]
    }
    
    typealias Item = Int
    
    var count: Int {
        return items.count
    }
    
    var items: [Item] = []
    
}

var intStack = IntStack()
intStack.append(1)
intStack.append(2)
intStack.append(3)
print(intStack.count)
print(intStack[2])

