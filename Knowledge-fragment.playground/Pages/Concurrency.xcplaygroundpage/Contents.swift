//: [Previous](@previous)

import Foundation

func run() {
    Task {
        await call()
    }
}

func call() async {
    do {
        let photoNames = try await listPhotos(inGallery: "sss")
        print("track 1")
        let sortedNames = photoNames.sorted()
        let name = sortedNames[0]
        print("track 2")
        let photo = try await downloadPhoto(named: name)
        print("track 3")
        print(photo)
    } catch {
        print("\(error)")
    }
}

func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    return ["1", "2"]
}

func downloadPhoto(named: String) async throws -> String {
    try await Task.sleep(until: .now + .seconds(1), clock: .continuous)
    return "apple"
}

func syncCall() async {
    do {
        let fristPhoto = try await downloadPhoto(named: "a")
        print("first")
        let secondPhoto = try await downloadPhoto(named: "a")
        print("second")
        let thirdPhoto = try await downloadPhoto(named: "a")
        print("third")
        let photos = [fristPhoto, secondPhoto, thirdPhoto]
        print(photos)
    } catch {
        print("\(error)")
    }
}

func concurrencyCall() async {
    print(#function)
    do {
        async let firstPhoto = downloadPhoto(named: "1")
        print("firstPhoto")
        async let secondPhoto = downloadPhoto(named: "2")
        print("secondPhoto")
        async let thirdPhoto = downloadPhoto(named: "3")
        print("thirdPhoto")
        let photos = try await [firstPhoto, secondPhoto, thirdPhoto]
        print(photos)
    } catch {
        print("\(error)")
    }
}

struct Dog: Identifiable, Codable {
    let message: String
    let status: String

    var id: String { message }
    var url: URL { URL(string: message)! }
}

@Observable class ViewModel {
    var dogs: [Dog] = []

    func fetchDog() async throws -> Dog {
        let dogURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, _) = try await URLSession.shared.data(from: dogURL)
        return try JSONDecoder().decode(Dog.self, from: data)
    }

    func fetchThreeDogs() async throws -> [Dog] {
        async let first = fetchDog()
        async let second = fetchDog()
        async let third = fetchDog()
        return try await [first, second, third]
    }

    func refresh() async {
        dogs = (try? await fetchThreeDogs()) ?? []
    }
}

// https://www.avanderlee.com/swift/async-await/
// https://www.kodeco.com/books/modern-concurrency-in-swift/v1.0/
// https://www.swiftbysundell.com/articles/connecting-async-await-with-other-swift-code/
// https://developer.apple.com/videos/play/wwdc2021/10132/
