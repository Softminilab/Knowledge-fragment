//: [Previous](@previous)

import Foundation
import Combine

var operation: (Int, Int) -> Int

operation = { (a, b) in
    return a + b
}

let result = operation(1, 2)
print(result)

let cancelable: AnyCancellable?

let subject = PassthroughSubject<String, Never>()
cancelable = subject.sink { val in
    print(Thread.current)
    print(Thread.current.name)
    print("22222")
    print(val)
}

for _ in 0...100 {
    DispatchQueue.global().async {
        print(Thread.current)
        print(Thread.current.name)
        print("11111")
        subject.send("1")
    }
}
