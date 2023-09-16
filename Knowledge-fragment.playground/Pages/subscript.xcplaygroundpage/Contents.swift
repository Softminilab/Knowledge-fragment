//: [Previous](@previous)

import Foundation

//struct Matrix {
//    let rows: Int, columns: Int
//    var grid: [Double]
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//    func indexIsValid(row: Int, column: Int) -> Bool {
//        return row >= 0 && row < rows && column >= 0 && column < columns
//    }
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            return grid[(row * columns) + column]
//        }
//        set {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            grid[(row * columns) + column] = newValue
//        }
//    }
//}
//
//var matrix = Matrix(rows: 2, columns: 2)
//matrix[0, 1] = 1.5
//
//struct Point {
//    var x: Int
//    var y: Int
//
//    subscript(index: Int) -> Int {
//        get {
//            switch index {
//            case 0: return x
//            case 1: return y
//            default: return 0
//            }
//        }
//        set {
//            switch index {
//            case 0: x = newValue
//            case 1: y = newValue
//            default: break
//            }
//        }
//    }
//}
//
//var point = Point(x: 10, y: 20)
//
//print(point[0]) // 10
//print(point[1]) // 20
//
//point[0] = 100
//print(point[0]) // 100

struct MyStruct {
    private var data = [Int]()
    
    subscript(index: Int) -> Int? {
        get {
            guard index >= 0, index < data.count else {
                return nil // 返回一个可选值，表示索引越界
            }
            return data[index]
        }
        set(newValue) {
            guard index >= 0, index < data.count else {
                print("11111")
                return // 不执行设置操作，因为索引越界
            }
            print("ddddddddd")
            data[index] = newValue!
        }
    }
}

var myInstance = MyStruct()

// 使用下标设置数组中的元素
myInstance[0] = 42
myInstance[1] = 23
