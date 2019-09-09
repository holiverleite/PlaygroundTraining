import UIKit

class ShoeFactory {
    var parts: String = ""
}

class Builder {
    let shoeFactory = ShoeFactory()
    var part = 0
    func buildPart() {
        part += 1
        shoeFactory.parts = shoeFactory.parts + "adding part # \(part)"
    }
    
    func getResult() -> ShoeFactory {
        print("Get Result")
        return shoeFactory
    }
}

class Director {
    let builder = Builder()
    
    init() {
        print("Build Director")
    }
    
    func construct() -> ShoeFactory {
        for _ in 1...5 {
            builder.buildPart()
        }
        return builder.getResult()
    }
}

let director = Director()
let shoe = director.construct()
print(shoe.parts)
