//: [Previous](@previous)

import Foundation

//do {
//    try <#expression#>
//    <#statements#>
//} catch <#pattern 1#> {
//    <#statements#>
//} catch <#pattern 2#> where <#condition#> {
//    <#statements#>
//} catch <#pattern 3#>, <#pattern 4#> where <#condition#> {
//    <#statements#>
//} catch {
//    <#statements#>
//}


//var vendingMachine = VendingMachine()
//vendingMachine.coinsDeposited = 8
//do {
//    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
//    print("Success! Yum.")
//} catch VendingMachineError.invalidSelection {
//    print("Invalid Selection.")
//} catch VendingMachineError.outOfStock {
//    print("Out of Stock.")
//} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
//    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
//} catch {
//    print("Unexpected error: \(error).")
//}

enum Errors: Error {
    case valueLessThanZero
}

func someThrowingFunction(index: Int) throws -> Int {
    guard index > 0 else {
        throw Errors.valueLessThanZero
    }
    
    return index
}

let x = try? someThrowingFunction(index: -1)
print(x)

let y: Int?
do {
    y = try someThrowingFunction(index: -1)
} catch {
    print("\(error)")
}

//////
func fetchDataFromDisk() throws -> Data? {
    return nil
}

func fetchDataFromServer() throws -> Data? {
    return nil
}

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}

fetchData()
