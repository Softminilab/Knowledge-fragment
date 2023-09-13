//: [Previous](@previous)

import Foundation

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        set { number = min(12, newValue) }
        get { return number }
    }
}


struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
rectangle.height = 10
print(rectangle.height)

rectangle.height = 12
print(rectangle.height)

rectangle.height = 30
print(rectangle.height)
