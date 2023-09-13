//: [Previous](@previous)

import Foundation

// 如果您需要为常量或变量提供与保留的 Swift 关键字相同的名称，请在将其用作名称时用反引号 (```) 括住关键字。但是，除非您别无选择，否则请避免使用关键字作为名称。
enum Types {
    case east
    case west
    case north
    case south
    case `default`
}
var type: Types = .default

let variable = 4
assert(variable > 3, "Must be greather than 3.")

let index = 2
precondition(index > 0, "Index must be greath than zore.")
