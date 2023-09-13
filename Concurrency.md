## Concurrency ❗️

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



> 使用 `async let` 调用异步函数，让它与其他异步代码并行运行。当您使用它返回的值时，请编写 `await` 。

```
func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}
```

> 使用 `Task` 从同步代码调用异步函数，而无需等待它们返回。

```
Task {
    await connectUser(to: "primary")
}
```

