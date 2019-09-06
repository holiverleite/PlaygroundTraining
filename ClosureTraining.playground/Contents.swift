// A simple example about how to implement Closures and how it works.
  
import UIKit

func filterWithPredicateClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filterNumbers: [Int] = []
    for num in numbers {
        if closure(num) {
            filterNumbers.append(num)
        }
    }
    return filterNumbers
}

func greaterThenThree(value: Int) -> Bool {
    return value > 3
}

func divisibleByFive(value: Int) -> Bool {
    return value % 5 == 0
}

let filteredList = filterWithPredicateClosure(closure: greaterThenThree, numbers: [1,2,5,6,7,9,12])
let filteredListDivided = filterWithPredicateClosure(closure: divisibleByFive, numbers: [1,2,5,6,7,9,12])

//let filteredList = filterWithPredicateClosure(closure: { (value) -> Bool in
//    return value < 5
//}, numbers: [1,2,5,6,7,9,12])

print(filteredList)
print(filteredListDivided)
