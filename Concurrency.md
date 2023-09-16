## Concurrency ❗️

#### 如果您以前编写过并发代码，您可能习惯于使用线程。 Swift 中的并发模型构建在线程之上，但您不直接与它们交互。 Swift 中的异步函数可以放弃它正在运行的线程，这让另一个异步函数在该线程上运行， `而第一个函数被阻塞。当异步函数恢复时，Swift 不保证该函数将在哪个线程上运行`。



------



要指示函数或方法是异步的，请在其声明中的参数后面写入 `async` 关键字，类似于使用 `throws` 标记抛出函数的方式。如果函数或方法返回值，请在返回箭头 ( `->` ) 之前写入 `async` 。例如，以下是获取图库中照片名称的方法：

```
func listPhotos(inGallery name: String) async -> [String] {
    let result = // ... some asynchronous networking code ...
    return result
}
```



-------------



#### 对于异步且抛出异常的函数或方法，可以在 `throws` 之前编写 `async` 。



-----------



调用异步方法时，执行会暂停，直到该方法返回。您可以在调用前面写入 `await` 以标记可能的挂起点。这就像调用抛出函数时编写 `try` 一样，以标记出现错误时程序流程可能发生的更改。在异步方法内部，仅当您调用另一个异步方法时，执行流程才会挂起 - 挂起永远不会是隐式的或抢占式的 - 这意味着每个可能的挂起点都用 `await` 标记。

例如，下面的代码获取图库中所有图片的名称，然后显示第一张图片：

```
let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)
```



-----------



#### 三个任务顺序执行

```
let firstPhoto = await downloadPhoto(named: photoNames[0])
let secondPhoto = await downloadPhoto(named: photoNames[1])
let thirdPhoto = await downloadPhoto(named: photoNames[2])


let photos = [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
```



### 三个任务并行执行，在结果集合中同步等待结果返回后，再进行下一步操作

```
async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])


let photos = await [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
```



> 使用 `async` 来标记异步运行的函数。

```
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}
```



> 您可以通过在异步函数前面写入 `await` 来标记对异步函数的调用。

```
func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
```



### 使用 `async let` 调用异步函数，让它与其他异步代码并行运行。当您使用它返回的值时，请编写 `await` 。

```
func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}
```



#### 使用 `Task` 从同步代码调用异步函数，而无需等待它们返回。

```
Task {
    await connectUser(to: "primary")
}
```

