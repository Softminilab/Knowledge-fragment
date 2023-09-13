//: [Previous](@previous)

import Foundation

func chooseStepFunction(backward: Bool) -> (Int) -> (Int) {
    func stepForward(intput: Int) -> Int { return intput + 1
    }
    
    func stepBackward(intput: Int) -> Int { return intput - 1
    }
    
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    currentValue = moveNearerToZero(currentValue)
    print(currentValue)
}

//& -> 两个二进制位都为1，则得1，否则得0
print(5 & 1)
print(4 & 1)

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runingTotal = 0
    func increment() -> Int {
        runingTotal += amount
        return runingTotal
    }
    
    return increment
}

let incrementTen = makeIncrementer(forIncrement: 10)
print(incrementTen())
print(incrementTen())
print(incrementTen())

let incrementSeven = makeIncrementer(forIncrement: 7)
print(incrementSeven())
print(incrementSeven())
print(incrementSeven())


// enum
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

let barcode = Barcode.qrCode("abcdefg")
switch barcode {
case .qrCode(let str): print(str)
case .upc(_, _, _, _): print("int, int, int, int")
}

switch barcode {
case let .qrCode(str): print(str)
case let .upc(a, b, c, d): print(a, b, c, d)
}
