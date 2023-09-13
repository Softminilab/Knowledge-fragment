## 基本

### 变量和常量

> 如果您需要为常量或变量提供与保留的 Swift 关键字相同的名称，请在将其用作名称时用反引号 (```) 括住关键字。但是，除非您别无选择，否则请避免使用关键字作为名称。

```
enum Types {
    case east
    case west
    case north
    case south
    case `default`
}
var type: Types = .default
```



### nil 零

> Swift 的 `nil` 与 Objective-C 中的 `nil` 不同。在 Objective-C 中， `nil` 是一个指向不存在对象的指针。在 Swift 中， `nil` 不是一个指针——它是缺少某种类型的值。任何类型的可选值都可以设置为 `nil` ，而不仅仅是对象类型



### 使用断言进行调试

> 如果您在未检查模式 ( `-Ounchecked` ) 下进行编译，则不会检查先决条件。编译器假定前提条件始终为真，并相应地优化您的代码。但是，无论优化设置如何， `fatalError(_:file:line:)` 函数始终会停止执行

```
let variable = 4
assert(variable > 3, "Must be greather than 3.")

let index = 2
precondition(index > 0, "Index must be greath than zore.")
```



