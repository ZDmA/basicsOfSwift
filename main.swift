//
//  main.swift
//  L6_ZDA
//
//  Created by Дмитрий Заика on 30.09.2021.
//

import Foundation

//MARK: - Queue
struct Queue<T> {

    private var items: [T] = []

    var upValue: T? { items.first }
    var count: Int { return items.count }

    mutating func push(value: T)  {
        print("pushing:", value, terminator: " ")
        items.append(value)
        printAll()
    }

    mutating func checkOutFisrt() -> T {
        let item = items.removeFirst()

        print("checkOutFisrt: exclude -", item, terminator: ". ")
        printAll()
        return item
    }

    mutating func checkOutLast()  -> T {
        let item = items.removeLast()

        print("checkOutLast: exclude -", item, terminator: ". ")
        printAll()
        return item
    }

    func printAll() {
        print("Queue: ", terminator: " ")
        items.forEach( { item in print(item, separator: ", ", terminator: " ") })
        print("")
    }

/*    subscript (item: Int) -> String {
        if item > items.endIndex {
            return "Your index items out of range"
        }

    }*/

    subscript(indexs: Int ...) -> Int {
        var itemsTotal: Int = 0
        for index in indexs where index < self.items.count {
            itemsTotal += 1
        }
        return itemsTotal
    }
}

//MARK: - User code home work №4
var intQueue = Queue<Int>()

intQueue.push(value: 1)
intQueue.push(value: 2)
intQueue.push(value: 3)
intQueue.push(value: 4)
intQueue.push(value: 5)
intQueue.push(value: 6)
intQueue.push(value: 7)
intQueue.push(value: 8)
intQueue.push(value: 9)

print("Count items = ", intQueue.count)
print("\nTake removed last item - ", intQueue.checkOutLast())
print("Count items = ", intQueue.count)
print("Take removed first item - ", intQueue.checkOutFisrt())
intQueue.push(value: 367)
print("subscripting = ", intQueue[0,1,2,5,245,10000])


print("String Queue")

var stringQueue = Queue<String>()

stringQueue.push(value: "Card")
stringQueue.push(value: "Dark")
stringQueue.push(value: "Mark")
stringQueue.push(value: "Park")
stringQueue.push(value: "fork")
stringQueue.push(value: "Car")


print("Count items = ", stringQueue.count)
print("\nTake removed last item - ", stringQueue.checkOutLast())
print("Count items = ", stringQueue.count)
print("Take removed first item - ", stringQueue.checkOutFisrt())
print("subscripting = ", intQueue[0,2,4,134567,333333333])




