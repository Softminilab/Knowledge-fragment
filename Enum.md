## Enum

### Recursive Enumeration （递归枚举）

递归枚举是一种将枚举的另一个实例作为一个或多个枚举情况的关联值的枚举。您可以通过在枚举之前写入 `indirect` 来指示枚举情况是递归的，这告诉编译器插入必要的间接层。

例如，下面是一个存储简单算术表达式的枚举：

```
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

您还可以在枚举开始之前编写 `indirect` ，以便为具有关联值的所有枚举情况启用间接：

```
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```



```
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

```



```
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}


print(evaluate(product))
// Prints "18"
```

