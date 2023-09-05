## Swift tour

### 函数

* 一个函数可以返回另一个函数作为其值

  ```
  func makePlusNumber() -> ((Int) -> (Int)) {
      
      // method 1
      func abc(a: Int) -> Int {
          return a + 1
      }
      
      return abc
      
  //     method 2
  //    return { a in
  //        a + 1
  //    }
  }
  
  let abc = makePlusNumber()
  let result = abc(1)
  print(result)
  ```

  

* 一个函数可以将另一个函数作为其参数之一

  ```
  func isExist(list: [Int], condition: (Int) -> Bool) -> Bool {
      for i in list {
          if condition(i) {
              return true
          }
      }
      return false
  }
  
  func condition(a: Int) -> Bool {
      return a > 8
  }
  
  isExist(
      list: [1,20],
      condition: condition
  )
  
  ```

  

## 协议和扩展

* 使用 `protocol` 声明协议。

  ```
  protocol ExampleProtocol {
       var simpleDescription: String { get }
       mutating func adjust()
  }
  ```

  

* 类、枚举和结构体都可以采用协议。

  ```
  class SimpleClass: ExampleProtocol {
       var simpleDescription: String = "A very simple class."
       var anotherProperty: Int = 69105
       func adjust() {
            simpleDescription += "  Now 100% adjusted."
       }
  }
  var a = SimpleClass()
  a.adjust()
  let aDescription = a.simpleDescription
  
  
  struct SimpleStructure: ExampleProtocol {
       var simpleDescription: String = "A simple structure"
       mutating func adjust() {
            simpleDescription += " (adjusted)"
       }
  }
  var b = SimpleStructure()
  b.adjust()
  let bDescription = b.simpleDescription
  ```

  

* 使用 `extension` 向现有类型添加功能，例如新方法和计算属性。您可以使用扩展将协议一致性添加到在其他地方声明的类型，甚至是从库或框架导入的类型。

  ```
  extension Int: ExampleProtocol {
      var simpleDescription: String {
          return "The number \(self)"
      }
      mutating func adjust() {
          self += 42
      }
   }
  var seven = 7
  seven.simpleDescription
  seven.adjust()
  
  extension Double: ExampleProtocol {
      var simpleDescription: String {
          return "The number \(self)"
      }
      mutating func adjust() {
          self += 42.76
      }
  }
  
  var absoluteValue = 7.06
  absoluteValue.simpleDescription
  absoluteValue.adjust()
  
  ```



### ## Error Handling 错误处理

* 有多种方法可以处理错误。一种方法是使用 `do` - `catch` 。在 `do` 块内，您可以通过在其前面写入 `try` 来标记可能引发错误的代码。在 `catch` 块内，错误会自动命名为 `error` ，除非您为其指定其他名称。
  ```
  do {
      let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
      print(printerResponse)
  } catch {
      print(error)
  }
  // Prints "Job sent"
  ```

  ```
  func send(job: Int, toPrinter printerName: String) throws -> String {
      if printerName == "Never Has Toner" {
          throw PrinterError.noToner
      }
      return "Job sent"
  }
  ```

  

* ‼️ 处理错误的另一种方法是使用 `try?` 将结果转换为可选值。如果函数抛出错误，则丢弃特定错误，结果为 `nil` 。否则，结果是一个可选值，包含函数返回的值。
  ```
  let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
  let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
  ```

  

