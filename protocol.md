## protocol

### AnyObject

AnyObject表示这个协议只能被class类型遵循,不能被struct或enum等值类型遵循。

因为AnyObject自身就表示一个类类型的实例(instance of class)。

其内在机制和原理是:

Swift中的协议分为“类类型专属协议”和“任意类型可用协议”:

- 类类型专属协议只能被类类型采用,必须明确限制为AnyObject
- 而任意类型可用的协议可以被类、结构体、枚举等任意类型采用

对于一些需要identity或运行时动态特性的协议,只能被类类型安全地采用,所以需要用AnyObject进行限制。

这满足了Swift中值类型与引用类型的区分,使协议可以仅在适当的类型上使用。

所以AnyObject限制了协议只适用于类,这是Swift协议设计的一个关键特性。



### 协议组合

协议组合的形式为 `SomeProtocol & AnotherProtocol` 。您可以根据需要列出任意多个协议，并用与号 ( `&` ) 分隔它们。除了协议列表之外，协议组合还可以包含一种类类型，您可以使用它来指定所需的超类。

下面是一个示例，它将两个名为 `Named` 和 `Aged` 的协议组合成函数参数的单个协议组合要求：

```
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)
// Prints "Happy birthday, Malcolm, you're 21!"
```



### 向协议添加约束

定义协议扩展时，可以指定在扩展的方法和属性可用之前一致类型必须满足的约束。您可以通过编写通用 `where` 子句在要扩展的协议名称之后编写这些约束

例如，您可以定义 `Collection` 协议的扩展，该扩展适用于其元素符合 `Equatable` 协议的任何集合。通过将集合的元素限制为标准库的一部分 `Equatable` 协议，您可以使用 `==` 和 `!=` 运算符来检查集合之间的相等性和不相等性两个要素。

```
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
```

