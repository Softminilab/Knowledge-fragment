//: [Previous](@previous)

// Strings and Characters
import Foundation

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

//要制作以换行符开头或结尾的多行字符串文字，请编写一个空行作为第一行或最后一行。例如：


let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print(lineBreaks)

// 转义
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)

let threeMoreDoubleQuotationMarks2 = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks2)

let line = #"Line 1\#nLine 2"#
print(line)

print(#"Write an interpolated string in Swift using \(multiplier)."#)

print(#"6 times 7 is \#(6 * 7)."#)
