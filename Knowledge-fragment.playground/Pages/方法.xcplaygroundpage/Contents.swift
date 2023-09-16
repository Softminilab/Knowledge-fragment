//: [Previous](@previous)

import Foundation

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[4])

enum Plant: Int {
    case mercry = 1
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    
    static subscript(n: Int) -> Plant {
        return Plant(rawValue: n)!
    }
}

let mars = Plant[4]
print(mars)

class Residence {
    var roomsName: [String] = []
    var numberOfRooms: Int {
        return roomsName.count
    }
    
    subscript(i: Int) -> String {
        get {
            return roomsName[i]
        }
        
        set {
            roomsName[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
}

var residence = Residence()
residence.roomsName.append(contentsOf: ["a", "b", "c"])
print(residence[0])
residence[1] = "d"
residence.roomsName
residence.printNumberOfRooms()
//residence[3] = "3"
